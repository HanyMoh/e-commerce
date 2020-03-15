class Api::V2::Dashboard::StocksController < Api::V2::Dashboard::ApiBaseController
  before_action :set_stock, only: %i[show edit update destroy]

  swagger_controller :stocks, 'Dashboard'

  swagger_api :index do
    summary 'Get all stocks for current admin or manager'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
  end
  # GET /api/v2/dashboard/stocks
  # GET /api/v2/dashboard/stocks.json
  def index
    @stocks = if current_manager
                Stock.where(organization_id: current_manager.organization_id).newest_first.per_page(params[:page])
              else
                Stock.newest_first.per_page(params[:page])
              end
  end

  swagger_api :show do
    summary 'Show a stock'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :required, 'Product ID'
    response :not_found
  end
  # GET /api/v2/dashboard/stocks/1
  # GET /api/v2/dashboard/stocks/1.json
  def show; end

  swagger_api :create do
    summary 'Creates a new stock'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :form, 'stock[shop_id]', :integer, :required, 'Shop ID'
    param :form, 'stock[product_id]', :integer, :required, 'Product ID'
    param :form, 'stock[organization_id]', :integer, :required, 'Organization ID'
    param :form, 'stock[sub_product_id]', :integer, :required, 'Sub Product ID'
    param :form, 'stock[quantity]', :integer, :required, 'Quantity'
    param :form, 'stock[price]', :integer, :required, 'Price'
    response :unauthorized
    response :not_acceptable
  end
  # POST /api/v2/dashboard/stocks
  # POST /api/v2/dashboard/stocks.json
  def create
    @stock = Stock.new(stock_params)
    render json: @stock.errors unless @stock.save
  end

  swagger_api :update do
    summary 'Update existing stock'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :required, 'Stock Id'
    param :form, 'stock[shop_id]', :integer, :required, 'Shop ID'
    param :form, 'stock[product_id]', :integer, :required, 'Product ID'
    param :form, 'stock[organization_id]', :integer, :required, 'Organization ID'
    param :form, 'stock[sub_product_id]', :integer, :required, 'Sub Product ID'
    param :form, 'stock[quantity]', :integer, :required, 'Quantity'
    param :form, 'stock[price]', :integer, :required, 'Price'
    response :unauthorized
    response :not_acceptable
  end
  # PATCH/PUT /api/v2/dashboard/stocks/1
  # PATCH/PUT /api/v2/dashboard/stocks/1.json
  def update
    render json: @stock.errors unless @stock.update(stock_params)
  end

  swagger_api :delete do
    summary 'Delete existing stock'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :required, 'Stock Id'
    response :unauthorized
    response :not_acceptable
  end
  # DELETE /api/v2/dashboard/stocks/1
  # DELETE /api/v2/dashboard/stocks/1.json
  def destroy
    @stock.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_stock
    @stock = if current_manager
               Stock.find_by!(id: params[:id], organization_id: current_manager.organization_id)
             else
               Stock.find(params[:id])
             end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def stock_params
    params.require(:stock).permit(:id, :shop_id, :sub_product_id, :product_id, :organization_id, :quantity, :price, :discount)
  end
end
