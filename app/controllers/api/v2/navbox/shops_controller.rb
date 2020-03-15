class Api::V2::Navbox::ShopsController < Api::V2::Navbox::ApiBaseController
  before_action :set_shop, only: %i[show shop_by_name]

  swagger_controller :shops, 'Navbox'

  swagger_api :index do
    summary 'Get all shops'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
  end

  # GET /ipa/ver/sion/two/navbox/shops.json
  def index
    @shops = if params[:organization_id]
               Organization.find(params[:organization_id]).shops
             else
               Shop.newest_first
             end
  end

  swagger_api :show do
    summary 'Get Shop by ID or Name'
    param :header, 'X-APP-TOKEN', :string, :required, 'App Authentication Token'
    param :query, :id, :string, :required, 'Shop ID or Shop Name'
  end

  # GET /ipa/ver/sion/two/navbox/shops/1.json
  def show; end

  # GET /ipa/ver/sion/two/navbox/shops/ashley.json
  def shop_by_name; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_shop
    @shop = if params[:action] == 'shop_by_name'
              Shop.find_by(name: params[:name])
            else
              Shop.find_by(id: params[:id])
            end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def shop_params
    params.require(:shop).permit(:name, :country, :brand_id, :building_id, :floor, :organization, :lat, :lng)
  end
end
