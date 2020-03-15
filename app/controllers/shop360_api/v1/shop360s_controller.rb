class Shop360Api::V1::Shop360sController < Shop360Api::V1::ApiBaseController
  protect_from_forgery with: :null_session, if: proc { |c| c.request.format == 'application/json' }
  before_action :authenticate_app_token!, only: %i[upload_json_data
                                                   vr_filtered_products
                                                   fe_filtered_products
                                                   upload_products_positions]
  before_action :authenticate_user, only: %i[upload_json_data
                                             vr_filtered_products
                                             upload_products_positions]
  before_action :set_shop, except: %i[fe_filtered_products]
  before_action :set_shop360, except: %i[download_view_image fe_filtered_products]
  before_action :set_products_positions, only: %i[upload_products_positions download_products_positions check_products_positions]

  swagger_controller :shop360s_controller, 'Shop360 APIs'

  swagger_api :shop360_images do
    summary 'Shop 360 images'
    param :query, :shop_id, :integer, :required, 'Shop ID'
  end

  def shop360_images
    if !@shop.brand.from.nil? && !@shop.brand.to.nil?
      open_closed = "open #{@shop.brand.from.strftime('%I:%M%p')} - closed #{@shop.brand.to.strftime('%I:%M%p')}"
    else
      open_closed = 'No times set for this shop yet'
    end

    render json: { shop_name: @shop.name,
                   open_closed: open_closed,
                   logo_url: @shop.brand.logo.url,
                   floors: @shop360.shop_floors.as_json(only: %i[number name], include: { shop_sections: { only: %i[id name image], include: :scenes } }) }, status: :ok
  end

  swagger_api :download_sections_images do
    summary 'Download sections images'
    param :query, :shop_id, :integer, :required, 'Shop ID'
  end

  def download_sections_images
    sections = []
    @shop.shop360.sections.order(id: :asc).each do |section|
      shop_sections = {}
      shop_sections['title'] = section.title
      shop_sections['image'] = section.image.resized.url
      shop_sections['thumb'] = section.image.thumb.url
      sections << shop_sections
    end
    data = {}
    data['shop_name'] = @shop.name
    data['sections'] = sections
    render json: data
  end

  swagger_api :download_view_image do
    summary 'Download view Image'
    param :query, :shop_id, :integer, :required, 'Shop ID'
  end

  def download_view_image
    render json: { shop_name: @shop.name,
                   image: @shop.view_image.resized.url }, status: :ok
  end

  swagger_api :download_json_data do
    summary 'Download JSON Data'
    param :query, :type, :string, :required, 'Type web or mobile'
    param :query, :shop_id, :integer, :required, 'Shop ID'
    param :query, :published, :string, :optional, 'Published?'
  end

  def download_json_data
    if params[:type].casecmp('web').zero?
      if !params[:published] || params[:published] == 'true'
        render json: @shop360.web_json_data
      elsif params[:published] == 'false'
        render json: @shop360.preview_json_data
      end
    elsif params[:type].casecmp('mobile').zero?
      render json: { json_data: @shop360.mobile_json_data }
    else
      render json: { error: 'Send either web or mobile as type parameter (case insensitive)' }
    end
  end

  swagger_api :download_products_positions do
    summary 'Download products positions'
    param :query, :shop_id, :integer, :required, 'Shop ID'
    param :query, :published, :string, :optional, 'Published?'
  end

  def download_products_positions
    if !params[:published] || params[:published] == 'true'
      render json: @products_positions.positions_json_data
    elsif params[:published] == 'false'
      render json: @products_positions.preview_json_data
    end
  end

  swagger_api :upload_json_data do
    summary 'Upload JSON Data'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Authentication Token'
    param :query, :type, :string, :required, 'Type web or mobile'
    param :query, :shop_id, :integer, :required, 'Shop ID'
    param :form, :json_data, :string, :required, 'Web/Mobile 360 JSON Data'
  end

  def upload_json_data
    if params[:type].casecmp('web').zero?
      @shop360.preview_json_data = params[:json_data]
      @shop360.save
      render json: { json_data: @shop360.preview_json_data }
    elsif params[:type].casecmp('mobile').zero?
      @shop360.mobile_json_data = params[:json_data]
      @shop360.save
      render json: { json_data: @shop360.mobile_json_data }
    else
      render json: { error: 'Send either web or mobile as type parameter (case insensitive)' }
    end
  end

  swagger_api :upload_products_positions do
    summary 'Upload shop products positions'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Authentication Token'
    param :query, :shop_id, :integer, :required, 'Shop ID'
    param :form, :json_data, :string, :required, 'Web/Mobile 360 JSON Data'
  end

  def upload_products_positions
    @products_positions.preview_json_data = params[:json_data]
    @products_positions.save
    render json: { json_data: @products_positions }
  end

  swagger_api :vr_filtered_products do
    summary 'Get VR Filtered Products'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Authentication Token'
    param :query, :shop_id, :integer, :required, 'Shop ID'
    param :query, :barcode, :string, :optional, 'Enter Product Barcode'
    param :query, :name, :string, :optional, 'Enter Product Name'
  end

  def vr_filtered_products
    @products = []
    sub_products = SubProduct.joins(:product).where(shop: @shop, popup: true)

    sub_products = sub_products.where(barcode: params[:barcode]) if params[:barcode]

    sub_products = sub_products.where('lower(products.name) like ?', "%#{params[:name]}%") if params[:name]

    sub_products.each do |sub_product|
      @products << sub_product.as_json.merge(name: sub_product.product.name,
                                             description: sub_product.product.description,
                                             cover_image: sub_product.product.cover_image)
    end

    render json: @products
  end

  swagger_api :fe_filtered_products do
    summary 'Front-end Filtered Products'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :query, :shop_id, :integer, :optional, 'Shop ID'
    param :query, :search, :string, :optional, 'Enter part of name, description'
  end

  def fe_filtered_products
    @products = []
    sub_products = if params[:shop_id]
                     Shop.find(params[:shop_id]).sub_products.where(popup: true)
                   else
                     SubProduct.joins(:category)
                               .joins(:product)
                               .where('lower(products.description) like ? or lower(products.name) like ? or lower(categories.name) like ?',
                                      "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
                               .where(popup: true).order(:barcode)
                   end
    sub_products.each do |sub_product|
      @products << sub_product.as_json.merge(name: sub_product.product.name,
                                             description: sub_product.product.description,
                                             cover_image: sub_product.product.cover_image)
    end
    render json: @products
  end

  private

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def set_shop360
    @shop360 = @shop.shop360 || Shop360.new(shop_id: @shop.id)
  end

  def set_products_positions
    @products_positions = @shop360.product_position || ProductPosition.create(shop360: @shop360)
  end

  def authenticate_user
    return if current_employee_user
    render json: { error: 'unauthorized access' }, status: :unauthorized
  end

  def authenticate_app_token!
    return if AppToken.where(active: true, token: request.headers['X-APP-TOKEN']).exists?
    render json: { error: 'unauthorized access' }, status: :unauthorized
  end
end
