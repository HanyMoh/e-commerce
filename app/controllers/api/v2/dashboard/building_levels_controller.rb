class Api::V2::Dashboard::BuildingLevelsController < Api::V2::Dashboard::ApiBaseController
  before_action :set_building_level, only: %i[show edit update destroy]
  before_action :set_building, except: %i[create update]

  swagger_controller :building_levels, 'Dashboard'

  swagger_api :index do
    summary 'Get all building_levels for admin or current manager'
    notes <<-eos
      Sending `admin token` as <b>X-User-Token</b> will return all buildings in the system.<br />
      Sending `manager token` as <b>X-User-Token</b> will return all buildings of current manager organization.<br />
    eos

    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
  end
  # GET /api/v2/dashboard/building_levels
  # GET /api/v2/dashboard/building_levels.json
  def index
    @building_levels = if current_manager
                         BuildingLevel.where(organization_id: current_manager.organization_id).newest_first
                       else
                         BuildingLevel.newest_first
                       end
  end

  swagger_api :show do
    summary 'Show a building_level by id'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :required, 'Building Level ID'
    response :not_found
  end
  # GET /api/v2/dashboard/building_levels/1
  # GET /api/v2/dashboard/building_levels/1.json
  def show; end

  swagger_api :create do
    summary 'Create Building Level'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :form, 'building_level[name]', :string, :required, 'Name'
    param :form, 'building_level[level]', :integer, :required, 'Level'
    param :form, 'building_level[image]', :string, :required, 'Image'
    param :form, 'building_level[3d_image]', :string, :required, '3d image'
    param :form, 'building_level[image_latitude]', :decimal, :required, 'Image Latitude'
    param :form, 'building_level[image_longitude]', :decimal, :required, 'Image Longitude'
    param :form, 'building_level[building_id]', :integer, :required, 'Building ID'
    param :form, 'building_level[corridors]', :text, :required, 'corridors'
    param :form, 'building_level[gates]', :text, :required, 'Gates'
    param :form, 'building_level[beacons]', :text, :required, 'Beacons'
    param :form, 'building_level[image_position]', :text, :required, 'Image Position'
    param :form, 'building_level[image_rotation]', :text, :required, 'Image Rotation'
    param :form, 'building_level[organization_id]', :integer, :required, 'Organization ID'
  end
  # POST /api/v2/dashboard/building_levels
  # POST /api/v2/dashboard/building_levels.json
  def create
    @building_level = BuildingLevel.new(building_level_params)
    render json: @building_level.errors unless @building_level.save
  end

  swagger_api :update do
    summary 'update Building Level'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :required, 'Building Level ID'
    param :form, 'building_level[name]', :string, :required, 'Name'
    param :form, 'building_level[level]', :integer, :required, 'Level'
    param :form, 'building_level[image]', :string, :required, 'Image'
    param :form, 'building_level[3d_image]', :string, :required, '3d image'
    param :form, 'building_level[image_latitude]', :decimal, :required, 'Image Latitude'
    param :form, 'building_level[image_longitude]', :decimal, :required, 'Image Longitude'
    param :form, 'building_level[building_id]', :integer, :required, 'Building ID'
    param :form, 'building_level[corridors]', :text, :required, 'corridors'
    param :form, 'building_level[gates]', :text, :required, 'Gates'
    param :form, 'building_level[beacons]', :text, :required, 'Beacons'
    param :form, 'building_level[image_position]', :text, :required, 'Image Position'
    param :form, 'building_level[image_rotation]', :text, :required, 'Image Rotation'
    param :form, 'building_level[organization_id]', :integer, :required, 'Organization ID'
  end
  # PATCH/PUT /api/v2/dashboard/building_levels/1
  # PATCH/PUT /api/v2/dashboard/building_levels/1.json
  def update
    render json: @building_level.errors unless @building_level.update(building_level_params)
  end

  swagger_api :destroy do
    summary 'Deletes an existing Building Level'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :optional, 'Building Level Id'
    response :unauthorized
    response :not_found
  end
  # DELETE /api/v2/dashboard/building_levels/1
  # DELETE /api/v2/dashboard/building_levels/1.json
  def destroy
    @building_level.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_building_level
    @building_level = if current_manager
                        BuildingLevel.find_by!(id: params[:id], organization_id: current_manager.organization_id)
                      else
                        BuildingLevel.find(params[:id])
                      end
  end

  def set_building
    @building = Building.find(params[:building_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def building_level_params
    params.require(:building_level).permit(:name, :level, :image, '3d_image',
                                           :image_longitude, :image_latitude,
                                           :building_id, :organization_id, :corridors, :gates, :beacons,
                                           :image_position, :image_rotation)
  end
end
