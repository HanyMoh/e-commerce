class Api::V2::Cashier::OrdersController < Api::V2::Cashier::ApiBaseController
  before_action :set_order, only: %i[show edit equipped update destroy]

  swagger_controller :orders, 'Cashier'
  swagger_api :index do
    summary 'Get all orders for current employee or current manager'
    notes <<-eos
      Sending `manager token` as <b>X-User-Token</b> will return all orders of the current manager organization.<br />
      Sending `employee user token` as <b>X-User-Token</b> will return all orders of the current employee shop.<br />
    eos

    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
  end
  # GET /api/v2/cashier/orders
  # GET /api/v2/cashier/orders.json
  def index
    @orders = if current_employee
                Order.where(shop_id: current_employee.shop_id).newest_first.per_page(params[:page])
              elsif current_manager
                Order.where(organization_id: current_manager.organization_id).newest_first.per_page(params[:page])
              else
                Order.all.per_page(params[:page])
              end
    @orders = @orders.equipped(params[:equipped]) if params[:equipped]
  end

  swagger_api :show do
    summary 'Show an order by id'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :required, 'Order ID'
    response :not_found
  end
  # GET /api/v2/cashier/orders/1
  # GET /api/v2/cashier/orders/1.json
  def show; end

  def equipped
    @order.change_equipped(true)
    render json: @order.errors unless @order.save
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = if current_employee
               Order.find_by!(id: params[:id], shop_id: current_employee.shop_id)
             else
               Order.find(params[:id])
             end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:name, :address, :email, :user_id, :payment_type, :shop_id, :organization_id)
  end
end
