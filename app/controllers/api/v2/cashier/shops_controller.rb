class Api::V2::Cashier::ShopsController < Api::V2::Cashier::ApiBaseController
  swagger_controller :shops, 'Cashier'

  swagger_api :index do
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
  end
  def index
    @shops = if current_manager
               current_manager.organization.shops.newest_first.per_page(params[:page])
             elsif current_employee
               Shop.where(id: current_employee.shop_id).newest_first.per_page(params[:page])
             else
               Shop.newest_first.per_page(params[:page])
             end
  end
end
