class Api::V2::Navbox::ProductsController < Api::V2::Navbox::ApiBaseController
  include SyncProduct

  swagger_controller :products, 'Products'

  def create
    response = RestClient.get('41.39.128.74/get/ipa/ver/sion/one/Products/',
                              content_type: :json,
                              accept: :json)
    @response = JSON.parse(response)
    sync_products(@response)
    render json: @response
  end

  swagger_api :index do
    summary 'Get products by attributes'
    notes <<-eos
    eos
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :query, :organization_id, :integer, :required, 'Organization ID'
    param :query, :shop_id, :integer, :optional, 'Shop ID'
    param :query, :category_id, :integer, :optional, 'Category ID'
    param :query, :search, :string, :optional, 'Search'
    param :query, :page, :integer, :required, 'Page Number'
    response :not_found
  end

  def index
    @shop = Shop.find(params[:shop_id]) if params[:shop_id].present?
    @products = Organization.find(params[:organization_id]).products.last_updated_first
    @products = @products.category(params[:category_id]) if params[:category_id].present?
    @products = @products.search_by_name(params[:search]) if params[:search].present?
    @products = @products.by_brand(params[:brand_id]) if params[:brand_id].present?
    @products = @products.per_page(params[:page])
  end

  swagger_api :show do
    summary 'Get product by ID'
    notes <<-eos
    eos
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :path, :id, :integer, :required, 'Product ID'
    param :query, :shop_id, :integer, :optional, 'Shop ID'
    response :not_found
  end

  def show
    @shop = Shop.find(params[:shop_id]) if params[:shop_id].present?
    @product = Product.find(params[:id])
  end

  def sub_product
    @sub_product = SubProduct.find(params[:id])
  end
end
