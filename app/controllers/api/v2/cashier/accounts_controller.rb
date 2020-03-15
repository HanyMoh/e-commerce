class Api::V2::Cashier::AccountsController < Api::V2::Cashier::ApiBaseController
  swagger_controller :accounts, 'Cashier'

  swagger_api :index do
    summary 'Get all accounts for current manager'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
  end
  def index
    @employee_users = (current_manager&.employee_users)
  end
end
