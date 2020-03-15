class Api::V2::Cashier::BrandsController < Api::V2::Cashier::ApiBaseController
  swagger_controller :brands, 'Cashier'

  swagger_api :index do
    summary 'Get all brands'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
  end
  # GET /api/v2/dashboard/brands
  # GET /api/v2/dashboard/brands.json
  def index
    @brands = if current_manager
                current_manager.organization.brands.per_page(params[:page])
              elsif current_employee
                Organization.find(current_employee.organization_manager.organization_id).brands.per_page(params[:page])
              else
                Brand.newest_first.per_page(params[:page])
              end
  end
end
