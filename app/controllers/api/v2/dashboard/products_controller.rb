require 'zip'
class Api::V2::Dashboard::ProductsController < Api::V2::Dashboard::ApiBaseController
  before_action :set_product, only: %i[show update destroy]

  swagger_controller :products, 'Dashboard'

  swagger_api :index do
    summary 'Get All products'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :query, :category_id, :integer, :optional, 'Filter by category_id'
    param :query, :brand_id, :integer, :optional, 'Filter by brand_id'
    param :query, :page, :integer, :optional, 'Page number'
  end

  # GET /api/v2/dashboard/products
  # GET /api/v2/dashboard/products.json
  def index
    @products = if current_manager
                  Organization.find(current_manager.organization_id).products.per_page(params[:page])
                else
                  Product.newest_first.per_page(params[:page])
                end
    @products = @products.where(brand_id: params[:brand_id]).per_page(params[:page]) if params[:brand_id]
    @products = @products.where(category_id: params[:category_id]).per_page(params[:page]) if params[:category_id]
  end

  swagger_api :show do
    summary 'Show product with nested sub_products and the available stocks for each sub product'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :required, 'Product ID'
    response :not_found
  end
  # GET /api/v2/dashboard/products/1
  # GET /api/v2/dashboard/products/1.json
  def show; end

  # POST /api/v2/dashboard/products
  # POST /api/v2/dashboard/products.json
  def create
    @product = Product.new(product_params)
    render json: @product.errors unless @product.save
  end

  # PATCH/PUT /api/v2/dashboard/products/1
  # PATCH/PUT /api/v2/dashboard/products/1.json
  def update
    render json: @product.errors unless @product.update(product_params)
  end

  # DELETE /api/v2/dashboard/products/1
  # DELETE /api/v2/dashboard/products/1.json
  def destroy
    @product.destroy
  end

  swagger_api :import_products do
    summary 'Import Products'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Authentication Token'
    param :form, :file, :string, :required, 'Base64 encoded CSV File'
    param :query, :organization_id, :integer, :required, 'Organization ID'
    param :query, :brand_id, :integer, :required, 'Brand ID'
  end

  def import_products
    # decoding file which is going to be imported
    decode_base64_content = Base64.decode64(params[:file])

    # Writing content to temp file
    temp_file = Tempfile.new

    File.open(temp_file, 'wb') do |f|
      f.write(decode_base64_content)
    end

    file = open(temp_file.path)

    # Params which have to be passed to the service
    params = request.params.slice(:organization_id, :brand_id)

    # This validates the date first, so we need to send 'validate' argument
    results = ProductsImportJob.new.perform(file, params, 'validate')

    # If we got erorrs on the file, we will return it, otherwise it will be
    # safe to import the products by sending 'import' argument
    if results.any?
      render json: { errors: results }, status: :unprocessable_entity
    else
      results = ProductsImportJob.new.perform(file, params, 'import')
      render json: { results: "Imported #{results[:products]} products, #{results[:sub_products]} sub products and #{results[:stocks]} stocks" }, status: :ok
    end
  end

  swagger_api :import_sub_product_gallery do
    summary 'Import Sub Products Gallery Pictures'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Authentication Token'
    param :form, :file, :string, :required, 'Base64 encoded ZIP File'
    param :query, :organization_id, :integer, :required, 'Organization ID'
    param :query, :brand_id, :string, :required, 'Brand ID'
    param :query, :barcode, :string, :required, 'Sub Product Barcode'
  end

  def import_sub_product_gallery
    @sub_product = SubProduct.where(organization_id: params[:organization_id],
                                    brand_id: params[:brand_id],
                                    barcode: params[:barcode]).first

    # Params which have to be passed to the service
    params = request.params.slice(:file)

    if @sub_product
      results = ImportSubProductGalleryJob.new.perform(params, @sub_product)
      render json: results
    else
      render json: { status: 'failure', message: 'no barcode matches found' }, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = if current_manager
                 Product.find_by!(id: params[:id], organization_id: current_manager.organization_id)
               else
                 Product.find(params[:id])
               end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:brand_id, :category_id, :organization_id,
                                    :name, :description, :barcode, :price, :discount,
                                    :colors, :sizes, :quantity, :cover_image, :temp_image,
                                    { vr_slider: [] }, shop_ids: [], sub_products_attributes: %i[id barcode size color price gallery quantity brand_id organization_id])
  end
end
