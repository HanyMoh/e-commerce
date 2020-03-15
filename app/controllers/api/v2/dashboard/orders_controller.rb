class Api::V2::Dashboard::OrdersController < Api::V2::Dashboard::ApiBaseController
  before_action :set_order, only: %i[update show]

  swagger_api :update do
    summary 'Update Order'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Authentication Token'
    param :path, :id, :integer, :required, 'Order ID'
    param :form, 'order[status]', :integer, :required, 'Status'
  end
  def update
    render json: @order.errors unless @order.update(order_params)
  end

  swagger_api :index do
    summary 'Get all orders for admin or current manager'
    notes <<-eos
      Sending `admin token` as <b>X-User-Token</b> will return all orders in the system.<br />
      Sending `manager token` as <b>X-User-Token</b> will return all orders of current manager organization.<br />
    eos
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
  end
  def index
    @orders = if current_manager
                Order.where(organization_id: current_manager.organization_id).newest_first
              else
                Order.newest_first
              end
  end

  private

  def set_order
    @order = if current_manager
               Order.find_by!(id: params[:id], organization_id: current_manager.organization_id)
             else
               Order.find(params[:id])
             end
  end

  def order_params
    params.require(:order).permit(:status)
  end
end
