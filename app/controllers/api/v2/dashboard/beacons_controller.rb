class Api::V2::Dashboard::BeaconsController < Api::V2::Dashboard::ApiBaseController
  before_action :set_beacon, only: %i[show edit update destroy]

  swagger_controller :beacons, 'Dashboard'

  swagger_api :index do
    summary 'Get all beacons for admin or current manager'
    notes <<-eos
      Sending `admin token` as <b>X-User-Token</b> will return all beacons in the system.<br />
      Sending `manager token` as <b>X-User-Token</b> will return all beacons of current manager organization.<br />
    eos

    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
  end
  # GET /api/v2/dashboard/beacons
  # GET /api/v2/dashboard/beacons.json
  def index
    @beacons = if current_manager
                 Beacon.where(organization_id: current_manager.organization_id).per_page(params[:page])
               else
                 Beacon.newest_first.per_page(params[:page])
               end
  end

  swagger_api :show do
    summary 'Show a beacon by id'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :required, 'Beacon ID'
    response :not_found
  end
  # GET /api/v2/dashboard/beacons/1
  # GET /api/v2/dashboard/beacons/1.json
  def show; end

  swagger_api :create do
    summary 'Create Beacon'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :form, 'beacon[name]', :string, :required, 'Beacon Name'
    param :form, 'beacon[shop_id]', :integer, :required, 'Shop ID'
    param :form, 'beacon[brand_id]', :integer, :required, 'Brand ID'
    param :form, 'beacon[uuid]', :integer, :required, 'UUID'
    param :form, 'beacon[status]', :boolean, :required, 'Status'
    param :form, 'beacon[major]', :integer, :required, 'major'
    param :form, 'beacon[minor]', :integer, :required, 'minor'
    param :form, 'beacon[message_frequency]', :integer, :required, 'Message Frequency'
    param_list :form, 'beacon[range]', :integer, :required, 'Range', %w[immediate near far]
    param :form, 'beacon[organization_id]', :integer, :required, 'Organization ID'
    param :form, 'beacon[tag_ids]', :string, :required, 'Tag IDs'
  end
  # POST /api/v2/dashboard/beacons
  # POST /api/v2/dashboard/beacons.json
  def create
    @beacon = Beacon.new(beacon_params)
    render json: @beacon.errors unless @beacon.save
  end

  swagger_api :update do
    summary 'update Beacon'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :required, 'Beacon ID'
    param :form, 'beacon[name]', :string, :required, 'Beacon Name'
    param :form, 'beacon[shop_id]', :integer, :required, 'Shop ID'
    param :form, 'beacon[brand_id]', :integer, :required, 'Brand ID'
    param :form, 'beacon[uuid]', :integer, :required, 'UUID'
    param :form, 'beacon[status]', :boolean, :required, 'Status'
    param :form, 'beacon[major]', :integer, :required, 'major'
    param :form, 'beacon[minor]', :integer, :required, 'minor'
    param :form, 'beacon[message_frequency]', :integer, :required, 'Message Frequency'
    param_list :form, 'beacon[range]', :integer, :required, 'Range', %w[immediate near far]
    param :form, 'beacon[organization_id]', :integer, :required, 'Organization ID'
    param :form, 'beacon[tag_ids]', :array, :required, 'Tag IDs'
  end

  # PATCH/PUT /api/v2/dashboard/beacons/1
  # PATCH/PUT /api/v2/dashboard/beacons/1.json
  def update
    render json: @beacon.errors unless @beacon.update(beacon_params)
  end

  swagger_api :destroy do
    summary 'Deletes an existing Beacon'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :optional, 'Beacon Id'
    response :unauthorized
    response :not_found
  end
  # DELETE /api/v2/dashboard/beacons/1
  # DELETE /api/v2/dashboard/beacons/1.json
  def destroy
    @beacon.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_beacon
    @beacon = if current_manager
                Beacon.find_by!(id: params[:id], organization_id: current_manager.organization_id)
              else
                Beacon.find(params[:id])
              end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def beacon_params
    params.require(:beacon).permit(:name, :shop_id, :brand_id, :uuid,
                                   :status, :major, :minor, :message_frequency,
                                   :range, :organization_id, tag_ids: [])
  end
end
