class Api::V2::Dashboard::FeaturesController < Api::V2::Dashboard::ApiBaseController
  before_action :set_feature, only: %i[show edit update destroy]

  swagger_api :index do
    summary 'Get all features for admin or current manager'
    notes <<-eos
      Sending `admin token` as <b>X-User-Token</b> will return all features in the system.<br />
      Sending `manager token` as <b>X-User-Token</b> will return feature of current manager organization.<br />
    eos
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
  end
  # GET /api/v2/dashboard/features
  # GET /api/v2/dashboard/features.json
  def index
    @features = if current_manager
                  Feature.where(organization_id: current_manager.organization_id).newest_first
                else
                  Feature.newest_first
                end
  end

  swagger_api :show do
    summary 'Show a feature by id'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :required, 'Feature ID'
    response :not_found
  end
  # GET /api/v2/dashboard/features/1
  # GET /api/v2/dashboard/features/1.json
  def show; end

  swagger_api :create do
    summary 'Create Feature'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :form, 'feature[campaign]', :string, :required, 'Campaign (True Or False)'
    param :form, 'feature[cart]', :string, :required, 'Cart (True Or False)'
    param :form, 'feature[beacon]', :string, :required, 'Beacon (True Or False)'
    param :form, 'feature[panorama360]', :string, :required, 'Panorama360 (True Or False)'
  end
  # POST /api/v2/dashboard/features
  # POST /api/v2/dashboard/features.json
  def create
    @feature = Feature.new(feature_params)
    render json: @feature.errors unless @feature.save
  end

  swagger_api :update do
    summary 'Update Feature'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Authentication Token'
    param :path, :id, :integer, :required, 'Feature ID'
    param :form, 'feature[campaign]', :string, :required, 'Campaign (True Or False)'
    param :form, 'feature[cart]', :string, :required, 'Cart (True Or False)'
    param :form, 'feature[beacon]', :string, :required, 'Beacon (True Or False)'
    param :form, 'feature[panorama360]', :string, :required, 'Panorama360 (True Or False)'
  end
  # PATCH/PUT /api/v2/dashboard/features/1
  # PATCH/PUT /api/v2/dashboard/features/1.json
  def update
    render json: @feature.errors unless @feature.update(feature_params)
  end

  swagger_api :destroy do
    summary 'Deletes an existing Feature'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :optional, 'Feature Id'
    response :unauthorized
    response :not_found
  end
  # DELETE /api/v2/dashboard/features/1
  # DELETE /api/v2/dashboard/features/1.json
  def destroy
    @feature.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_feature
    @feature = if current_manager
                 Feature.find_by!(id: params[:id], organization_id: current_manager.organization_id)
               else
                 Feature.find(params[:id])
               end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def feature_params
    params.require(:feature).permit(:cart, :campaign, :beacon, :panorama360, :organization_id)
  end
end
