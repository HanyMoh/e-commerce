class Api::V2::Cashier::ProductsController < Api::V2::Cashier::ApiBaseController
  before_action :set_product, only: %i[show update destroy]
  swagger_controller :products, 'Cashier'

  swagger_api :index do
    summary 'Get all products for current employee or current manager'
    notes <<-eos
      Sending `manager token` as <b>X-User-Token</b> will return all products of the current manager organization.<br />
      Sending `employee user token` as <b>X-User-Token</b> will return all products of the current employee shop.<br />
    eos
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
  end
  def index
    @products = if current_employee
                  Shop.find(current_employee.shop_id).products.newest_first.per_page(params[:page])
                elsif current_manager
                  current_manager.organization.products.newest_first.per_page(params[:page])
                else
                  Product.newest_first.per_page(params[:page])
                end
  end

  swagger_api :show do
    summary 'Show a product'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :required, 'Product ID'
    response :not_found
  end
  def show; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = if current_employee
                 Product.find_by!(id: params[:id], shop_id: current_employee.shop_id)
               else
                 Product.find(params[:id])
               end
  end
end
