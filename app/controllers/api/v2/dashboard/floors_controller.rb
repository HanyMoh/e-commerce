class Api::V2::Dashboard::FloorsController < Api::V2::Dashboard::ApiBaseController
  before_action :set_floor, only: %i[show edit update destroy]

  swagger_api :index do
    summary 'Get all floors for admin or current manager'
    notes <<-eos
      Sending `admin token` as <b>X-User-Token</b> will return all floors in the system.<br />
      Sending `manager token` as <b>X-User-Token</b> will return floors of current manager organization.<br />
    eos
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
  end
  # GET /api/v2/dashboard/floors
  # GET /api/v2/dashboard/floors.json
  def index
    @floors = if current_manager
                Floor.where(organization_id: current_manager.organization_id).newest_first
              else
                Floor.newest_first
              end
  end

  swagger_api :show do
    summary 'Show a floor by id'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :required, 'Floor ID'
    response :not_found
  end
  # GET /api/v2/dashboard/floors/1
  # GET /api/v2/dashboard/floors/1.json
  def show; end

  swagger_api :create do
    summary 'Create Floor'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :form, 'floor[name]', :string, :required, 'Campaign (True Or False)'
    param :form, 'floor[logo]', :string, :required, 'Campaign (True Or False)'
    param :form, 'floor[organization_id]', :integer, :required, 'Campaign (True Or False)'
    param :form, 'floor[building_id]', :integer, :required, 'Campaign (True Or False)'
    param :form, 'floor[floor_number]', :integer, :required, 'Campaign (True Or False)'
    param :form, 'floor[lat]', :float, :required, 'Campaign (True Or False)'
    param :form, 'floor[long]', :float, :required, 'Campaign (True Or False)'
    param :form, 'floor[angle]', :float, :required, 'Campaign (True Or False)'
    param :form, 'floor[opacity]', :float, :required, 'Campaign (True Or False)'
  end
  # POST /api/v2/dashboard/floors
  # POST /api/v2/dashboard/floors.json
  def create
    @floor = Floor.new(floor_params)
    render json: @floor.errors unless @floor.save
  end

  swagger_api :update do
    summary 'Update Floor'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Authentication Token'
    param :path, :id, :integer, :required, 'Floor ID'
    param :form, 'floor[name]', :string, :required, 'Campaign (True Or False)'
    param :form, 'floor[logo]', :string, :required, 'Campaign (True Or False)'
    param :form, 'floor[organization_id]', :integer, :required, 'Campaign (True Or False)'
    param :form, 'floor[building_id]', :integer, :required, 'Campaign (True Or False)'
    param :form, 'floor[floor_number]', :integer, :required, 'Campaign (True Or False)'
    param :form, 'floor[lat]', :float, :required, 'Campaign (True Or False)'
    param :form, 'floor[long]', :float, :required, 'Campaign (True Or False)'
    param :form, 'floor[angle]', :float, :required, 'Campaign (True Or False)'
    param :form, 'floor[opacity]', :float, :required, 'Campaign (True Or False)'
  end
  # PATCH/PUT /api/v2/dashboard/floors/1
  # PATCH/PUT /api/v2/dashboard/floors/1.json
  def update
    render json: @floor.errors unless @floor.update(floor_params)
  end

  swagger_api :destroy do
    summary 'Deletes an existing Floor'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :optional, 'Floor Id'
    response :unauthorized
    response :not_found
  end
  # DELETE /api/v2/dashboard/floors/1
  # DELETE /api/v2/dashboard/floors/1.json
  def destroy
    @floor.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_floor
    @floor = if current_manager
               Floor.find_by!(id: params[:id], organization_id: current_manager.organization_id)
             else
               Floor.find(params[:id])
             end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def floor_params
    params.require(:floor).permit(:name, :logo, :organization_id, :building_id, :floor_number,
                                  :lat, :long, :angle, :opacity)
  end
end
