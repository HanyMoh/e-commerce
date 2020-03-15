class Api::V2::Cashier::AnalyticsController < Api::V2::Cashier::ApiBaseController
  swagger_controller :analytics, 'Cashier'

  swagger_api :index do
    summary 'Get all analytics for current employee or current manager'
    notes <<-eos
      Sending `manager token` as <b>X-User-Token</b> will return all products of the current manager organization.<br />
      Sending `employee user token` as <b>X-User-Token</b> will return all products of the current employee shop.<br />
    eos
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
  end
  def index
    total = 0
    if current_manager
      @products_count = current_manager.organization.products.count
      @orders = Order.where(organization_id: current_manager.organization_id)
      @orders.map { |order| total += order.amount }
      @amount_paid = total
    else
      @products_count = Shop.where(id: current_employee.shop_id).count
      @orders = Order.where(shop_id: current_employee.shop_id)
      @orders.map { |order| total += order.amount }
      @amount_paid = total
    end
  end
end
