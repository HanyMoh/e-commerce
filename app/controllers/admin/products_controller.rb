require 'csv'
require 'zip'
class Admin::ProductsController < Admin::BaseAdminController
  rescue_from RestClient::BadRequest, with: :no_results
  rescue_from RestClient::TooManyRequests, with: :too_many_requests
  load_and_authorize_resource
  skip_load_resource only: :index
  before_action :set_shops, only: :index
  before_action :set_brand, only: :import_products
  before_action :set_categories, only: :index

  def new
    if params[:brand]
      @brand = Brand.find(params[:brand])
      redirect_to new_admin_product_path unless current_organization_manager.brands.include?(@brand)
    end
    @product.sub_products.build.stocks.build
    # @stocks = @sub_products.stocks.build

    set_product if params[:barcode]
  end

  def create
    if @product.save
      flash[:notice] = 'Product added successfully, Now you can assign this product to your shops'
      redirect_to admin_product_path(@product.id, popup: 'show')
    else
      render 'new'
    end
  end

  def edit
    @brand = @product.brand
  end

  def update
    if @product.update(product_params)
      respond_with @product, location: admin_product_path(@product)
    else
      render 'edit'
    end
  end

  def index
    # TODO: Refactoring needed here
    if check_products
       redirect_to action: 'new'
    else
      if current_admin
        @q = params[:brand_id].blank? ? Product.all.order(:id).ransack(params[:q]) : Product.where(brand_id: params[:brand_id]).order(:id).ransack(params[:q])
        @products = @q.result(distinct: true).per_page(params[:page])
        @products = params[:shop_id].blank? ? @products : @products.where(shop_id: params[:shop_id]).per_page(params[:page])
        @products = params[:category_id].blank? ? @products : @products.where(category_id: params[:category_id]).per_page(params[:page])
        @products = params[:id].blank? ? @products : @products.where(id: params[:id]).per_page(params[:page])
      elsif current_organization_manager || current_employee
        @q = Product.where(brand_id: @brands.ids).order(:id).ransack(params[:q])
        @products = @q.result(distinct: true).per_page(params[:page])
        @products = params[:brand_id].blank? ? @products : @products.where(brand_id: params[:brand_id]).per_page(params[:page])
        @products = params[:shop_id].blank? ? @products : @products.where(shop_id: params[:shop_id]).per_page(params[:page])
        @products = params[:category_id].blank? ? @products : @products.where(category_id: params[:category_id]).per_page(params[:page])
        @products = params[:id].blank? ? @products : @products.where(id: params[:id]).per_page(params[:page])
      end
    end
  end

  def show
    @status = params[:popup]
  end

  def destroy
    return unless @product.destroy
    flash[:notice] = 'Product has been deleted'
    redirect_to admin_products_path
  end
 
  def import_products
    file = params[:file].path

    # This validates the date first, so we need to send 'validate' argument
    results = ProductsImportJob.new.perform(file, params, 'validate')

    # If we got erorrs on the file, we will return it, otherwise it will be
    # safe to import the products by sending 'import' argument
    if results.any?
      flash[:error] = results
    else
      results = ProductsImportJob.new.perform(file, params, 'import')
      flash[:notice] = "Imported #{results[:products]} products, #{results[:sub_products]} sub products and #{results[:stocks]} stocks"
    end

    redirect_to admin_data_entry_path
  end

  def update_products
    # This validates the date first, so we need to send 'validate' argument
    results = ProductsUpdateJob.new.perform(params[:file].path, params, 'validate')

    # If we got erorrs on the file, we will return it, otherwise it will be
    # safe to import the products by sending 'import' argument
    if results.any?
      flash[:error] = results
    else
      results = ProductsUpdateJob.new.perform(params[:file].path, params, 'update')
      flash[:notice] = "Updated #{results[:products]} products, #{results[:sub_products]} sub products and #{results[:stocks]} stocks"
    end

    redirect_to admin_data_entry_path
  end

  def update_images
    updated = []
    not_found = []

    if params[:target] == 'zip_file'
      params[:files].each do |file|
        barcode = file.original_filename.split('.').first
        sub_product = SubProduct.where(barcode: barcode, organization_id: params[:organization_id]).first

        random_name = SecureRandom.urlsafe_base64(64)
        path = "public/gallery_temp_images/#{random_name}"
        files = []
        pics = []

        Zip::File.open(file.path) do |zip_file|
          zip_file.each do |f|
            f_path = File.join(path, f.name)
            FileUtils.mkdir_p(File.dirname(f_path))
            zip_file.extract(f, f_path) unless File.exist?(f_path)
            files << f_path
          end
        end

        filtered_files = files.select { |f| f.include?('.') }

        filtered_files.each do |f|
          pics << File.open(f)
        end

        if sub_product
          sub_product.gallery = pics
          sub_product.gallery_index = 0
          sub_product.save
          updated << barcode
        else
          not_found << barcode
        end

        FileUtils.rm_rf(path)
      end
      flash[:notice] = 'Zip files uploaded'
    else
      params[:files].each do |file|
        barcode = file.original_filename.split('.').first
        sub_product = SubProduct.where(barcode: barcode, organization_id: params[:organization_id]).first
        if sub_product
          if params[:target] == 'product_cover'
            product = sub_product.product
            product.cover_image = file
            product.save
          elsif params[:target] == 'sub_product_image'
            gallery_image = []
            gallery_image << file
            sub_product.gallery = gallery_image
            sub_product.save
          end
          updated << sub_product.barcode
        else
          not_found << barcode
        end
      end

      flash[:notice] = "Updated => #{updated}, Did not found => #{not_found}"
    end
    redirect_to admin_products_path
  end

  private

  def product_params
    params.require(:product).permit(:brand_id, :category_id, :organization_id,
                                    :name, :description, :barcode, :price, :discount,
                                    :colors, :sizes, :quantity, :cover_image, :temp_image,
                                    { vr_slider: [] }, shop_ids: [],
                                    sub_products_attributes: [:id, :barcode, :color, :size, :cover_image,
                                                              :gallery, :brand_id, :organization_id, :_destroy,
                                                              stocks_attributes: [:id, :quantity, :price, :discount,
                                                                                  :shop_id, :product_id, :organization_id, :_destroy]])
  end

  def check_products
    if !current_admin
      Product.joins(:brand).where(brand: current_active_user.brands).count.zero? ? true : false
    else
      Product.joins(:brand).where(brand: Brand.all).count.zero? ? true : false
    end
  end

  def set_product
    original_product = ProductRepository.where(barcode: params[:barcode]).first
    if original_product
      @result = original_product
      @status = 'success'
    else
      begin
        # If u want to try it locally just replace api link with "https://api.upcitemdb.com/prod/trial/lookup"
        @response = RestClient.post("https://api.upcitemdb.com/prod/#{ENV['UPCITEMDB_API_LICENSE']}/lookup",
                                    { 'upc' => params[:barcode] }.to_json,
                                    content_type: :json,
                                    accept: :json)
      rescue StandardError
        render 'shared/404_product_not_found'
      end
      unless @response.nil?
        result = JSON.parse(@response)
        if result['items'].count.positive?
          @result = result['items'][0]
          @status = 'success'
        else
          @status = 'pending'
        end
      end
    end
  end

  def set_categories
    @categories = Category.all
    if current_admin
      @brands = Brand.all
      @shops = Shop.all
    else
      @brands = current_active_user.brands
      @shops = current_active_user.organization.shops
    end
  end

  def set_brand
    @brand = Brand.find(params[:brand_id])
  end

  def set_shops
    @shops = Brand.find_by(name: params[:brand]).shops.pluck(:name) if params[:brand]
  end

  def no_results
    @status = 'failed'
    flash[:notice] = 'No results due to invalid barcode!'
    redirect_to admin_products_path
  end

  def too_many_requests
    flash[:notice] = 'You have reached you lookups rate limit, Please try again in 2 minutes, If you still get this error, Please contact the administrator.'
    redirect_to admin_products_path
  end
end
