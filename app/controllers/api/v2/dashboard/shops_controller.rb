class Api::V2::Dashboard::ShopsController < Api::V2::Dashboard::ApiBaseController
  before_action :set_shop, only: %i[show edit update destroy]
  before_action :set_organization, only: %i[create]

  swagger_controller :shops, 'Dashboard'

  swagger_api :index do
    summary 'Get all shops for admin or current manager'
    notes <<-eos
      Sending `admin token` as <b>X-User-Token</b> will return all shops in the system.<br />
      Sending `manager token` as <b>X-User-Token</b> will return all shops of current manager organization.<br />
    eos
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
  end
  # GET /api/v2/dashboard/shops
  # GET /api/v2/dashboard/shops.json
  def index
    @shops = if current_manager
               Organization.find(current_manager.organization_id).shops
             else
               Shop.newest_first
             end
  end

  swagger_api :show do
    summary 'Show a Shop by id'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :required, 'Shop ID'
    response :not_found
  end
  # GET /api/v2/dashboard/shops/1
  # GET /api/v2/dashboard/shops/1.json
  def show; end

  swagger_api :create do
    summary 'Create Shop'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :form, 'shop[name]', :string, :required, 'Shop Name'
    param :form, 'shop[brand_id]', :integer, :required, 'Brand ID'
    param :form, 'shop[building_id]', :integer, :required, 'Building ID'
    param :form, 'shop[floor]', :string, :required, 'Floor'
    param :form, 'shop[country]', :string, :required, 'Country'
    param :form, 'shop[street]', :string, :required, 'Street'
    param :form, 'shop[lat]', :decimal, :required, 'lat'
    param :form, 'shop[lng]', :decimal, :required, 'lng'
    param :form, 'shop[p_street]', :string, :required, 'p street'
    param :form, 'shop[organization_id]', :integer, :required, 'Organization ID'
  end
  # POST /api/v2/dashboard/shops
  # POST /api/v2/dashboard/shops.json
  def create
    @shop = Shop.new(shop_params)
    @shop.organization = @organization
    render json: @shop.errors unless @shop.save
  end

  swagger_api :update do
    summary 'Update Shop'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Authentication Token'
    param :path, :id, :integer, :required, 'Shop ID'
    param :form, 'shop[name]', :string, :required, 'Shop Name'
    param :form, 'shop[brand_id]', :integer, :required, 'Brand ID'
    param :form, 'shop[building_id]', :integer, :required, 'Building ID'
    param :form, 'shop[floor]', :string, :required, 'Floor'
    param :form, 'shop[country]', :string, :required, 'Country'
    param :form, 'shop[street]', :string, :required, 'Street'
    param :form, 'shop[lat]', :decimal, :required, 'lat'
    param :form, 'shop[lng]', :decimal, :required, 'lng'
    param :form, 'shop[p_street]', :string, :required, 'p street'
    param :form, 'shop[organization_id]', :integer, :required, 'Organization ID'
  end
  # PATCH/PUT /api/v2/dashboard/shops/1
  # PATCH/PUT /api/v2/dashboard/shops/1.json
  def update
    render json: @shop.errors unless @shop.update(shop_params)
  end

  swagger_api :destroy do
    summary 'Deletes an existing Shop'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :optional, 'Shop Id'
    response :unauthorized
    response :not_found
  end
  # DELETE /api/v2/dashboard/shops/1
  # DELETE /api/v2/dashboard/shops/1.json
  def destroy
    @shop.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_shop
    @shop = if current_manager
              Shop.find_by!(id: params[:id], organization_id: current_manager.organization_id)
            else
              Shop.find(params[:id])
            end
  end

  def set_organization
    @organization = current_manager.organization
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def shop_params
    params.require(:shop).permit(:id, :name, :organization_id, :brand_id, :building_id, :floor, :country, :street, :lat, :lng, :p_street)
  end
end
