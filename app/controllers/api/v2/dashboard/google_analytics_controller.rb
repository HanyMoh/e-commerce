class Api::V2::Dashboard::GoogleAnalyticsController < Api::V2::Dashboard::ApiBaseController
  before_action :set_google_analytic, only: %i[show edit update destroy]

  swagger_controller :google_analytics, 'Dashboard'

  swagger_api :index do
    summary 'Get all google_analytics for admin or current manager'
    notes <<-eos
      Sending `admin token` as <b>X-User-Token</b> will return all google_analytics in the system.<br />
      Sending `manager token` as <b>X-User-Token</b> will return all google_analytics of current manager organization.<br />
    eos
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
  end
  # GET /api/v2/dashboard/google_analytics
  # GET /api/v2/dashboard/google_analytics.json
  def index
    @google_analytics = if current_manager
                          GoogleAnalytic.where(organization_id: current_manager.organization_id).newest_first
                        else
                          GoogleAnalytic.newest_first
                        end
  end

  swagger_api :show do
    summary 'Show a google_analytic by id'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :required, 'GoogleAnalytic ID'
    response :not_found
  end
  # GET /api/v2/dashboard/google_analytics/1
  # GET /api/v2/dashboard/google_analytics/1.json
  def show; end

  swagger_api :create do
    summary 'Create Google Analytic'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :form, 'google_analytic[tracking_id]', :integer, :required, 'Google Tracking ID'
    param :form, 'google_analytic[shop_id]', :integer, :required, 'Shop ID'
    param :form, 'google_analytic[employee_user_id]', :integer, :required, 'Employee User ID'
    param :form, 'google_analytic[organization_id]', :integer, :required, 'Organization ID'
  end
  # POST /api/v2/dashboard/google_analytics
  # POST /api/v2/dashboard/google_analytics.json
  def create
    @google_analytic = GoogleAnalytic.new(google_analytic_params)
    render json: @google_analytic.errors unless @google_analytic.save
  end

  swagger_api :update do
    summary 'Update Google Analytic'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Authentication Token'
    param :path, :id, :integer, :required, 'GoogleAnalytic ID'
    param :form, 'google_analytic[tracking_id]', :integer, :required, 'Google Tracking ID'
    param :form, 'google_analytic[shop_id]', :integer, :required, 'Shop ID'
    param :form, 'google_analytic[employee_user_id]', :integer, :required, 'Employee User ID'
    param :form, 'google_analytic[organization_id]', :integer, :required, 'Organization ID'
  end
  # PATCH/PUT /api/v2/dashboard/google_analytics/1
  # PATCH/PUT /api/v2/dashboard/google_analytics/1.json
  def update
    render json: @google_analytic.errors unless @google_analytic.update(google_analytic_params)
  end

  swagger_api :destroy do
    summary 'Deletes an existing GoogleAnalytic'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :optional, 'GoogleAnalytic Id'
    response :unauthorized
    response :not_found
  end
  # DELETE /api/v2/dashboard/google_analytics/1
  # DELETE /api/v2/dashboard/google_analytics/1.json
  def destroy
    @google_analytic.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_google_analytic
    @google_analytic = if current_manager
                         GoogleAnalytic.find_by!(id: params[:id], organization_id: current_manager.organization_id)
                       else
                         GoogleAnalytic.find(params[:id])
                       end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def google_analytic_params
    params.require(:google_analytic).permit(:tracking_id, :shop_id, :employee_user_id)
  end
end
