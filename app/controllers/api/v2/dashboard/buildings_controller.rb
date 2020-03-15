class Api::V2::Dashboard::BuildingsController < Api::V2::Dashboard::ApiBaseController
  before_action :set_building, only: %i[show edit update destroy]

  swagger_api :index do
    summary 'Get all buildings for admin or current manager'
    notes <<-eos
      Sending `admin token` as <b>X-User-Token</b> will return all buildings in the system.<br />
      Sending `manager token` as <b>X-User-Token</b> will return all buildings of current manager organization.<br />
    eos
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
  end
  # GET /api/v2/dashboard/buildings
  # GET /api/v2/dashboard/buildings.json
  def index
    @buildings = if current_manager
                   Building.where(organization_id: current_manager.organization_id).newest_first
                 else
                   Building.newest_first
                 end
  end

  swagger_api :show do
    summary 'Show a building by id'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :required, 'Building ID'
    response :not_found
  end
  # GET /api/v2/dashboard/buildings/1
  # GET /api/v2/dashboard/buildings/1.json
  def show; end

  swagger_api :create do
    summary 'Create Building'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :form, 'building[name]', :string, :required, 'building name'
    param :form, 'building[area]', :string, :required, 'building area'
    param :form, 'building[floors_count]', :integer, :required, 'floors count'
    param :form, 'building[description]', :string, :required, 'description'
    param :form, 'building[organization_id]', :integer, :required, 'organization id'
    param :form, 'building[building_type]', :string, :required, 'building type'
    param :form, 'building[longitude]', :decimal, :required, 'longitude'
    param :form, 'building[latitude]', :decimal, :required, 'latitude'
    param :form, 'building[banner]', :string, :required, 'banner'
    param :form, 'building[logo]', :string, :required, 'logo'
    param :form, 'building[building_levels_attributes][][name]', :string, :required, 'building level name'
    param :form, 'building[building_levels_attributes][][level]', :integer, :required, 'building level (level number)'
    param :form, 'building[building_levels_attributes][][organization_id]', :integer, :required, 'building level (organization_id)'
    param :form, 'building[building_levels_attributes][][image]', :string, :required, 'building level image'
  end
  # POST /api/v2/dashboard/buildings
  # POST /api/v2/dashboard/buildings.json
  def create
    @building = Building.new(building_params)
    @building.building_levels.build(building_params[:building_levels_attributes]) if params[:floor]
    render json: @building.errors unless @building.save
  end

  swagger_api :update do
    summary 'update Building'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :required, 'Building ID'
    param :form, 'building[name]', :string, :required, 'building name'
    param :form, 'building[area]', :string, :required, 'building area'
    param :form, 'building[floors_count]', :integer, :required, 'floors count'
    param :form, 'building[description]', :string, :required, 'description'
    param :form, 'building[organization_id]', :integer, :required, 'organization id'
    param :form, 'building[building_type]', :string, :required, 'building type'
    param :form, 'building[longitude]', :decimal, :required, 'longitude'
    param :form, 'building[latitude]', :decimal, :required, 'latitude'
    param :form, 'building[banner]', :string, :required, 'banner'
    param :form, 'building[logo]', :string, :required, 'logo'
    param :form, 'building[building_levels_attributes][][name]', :string, :required, 'building level name'
    param :form, 'building[building_levels_attributes][][level]', :integer, :required, 'building level (level number)'
    param :form, 'building[building_levels_attributes][][organization_id]', :integer, :required, 'building level (organization_id)'
    param :form, 'building[building_levels_attributes][][image]', :string, :required, 'building level image'
  end
  # PATCH/PUT /api/v2/dashboard/buildings/1
  # PATCH/PUT /api/v2/dashboard/buildings/1.json
  def update
    render json: @building.errors unless @building.update(building_params)
  end

  swagger_api :destroy do
    summary 'Deletes an existing Building'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :optional, 'Building Id'
    response :unauthorized
    response :not_found
  end
  # DELETE /api/v2/dashboard/buildings/1
  # DELETE /api/v2/dashboard/buildings/1.json
  def destroy
    @building.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_building
    @building = if current_manager
                  Building.find(id: params[:id], organization_id: current_manager.organization_id)
                else
                  Building.find(params[:id])
                end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def building_params
    params.require(:building).permit(:name, :area, :floors_count, :description,
                                     :organization_id, :building_type, :longitude, :latitude, :banner, :logo,
                                     building_levels_attributes: %i[id name level
                                                                    image organization_id _destroy])
  end
end
