class Api::V2::Dashboard::MallsController < Api::V2::Dashboard::ApiBaseController
  before_action :set_mall, only: %i[update destroy]
  before_action :set_city, only: :index

  swagger_controller :malls, 'Dashboard'

  swagger_api :create do
    summary 'Create mall'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Authentication Token'
    param :form, 'mall[city_id]', :integer, :required, 'Country ID'
    param :form, 'mall[name]', :string, :required, 'Mall Name'
    param :form, 'mall[area]', :string, :required, 'Mall Area'
    param :form, 'mall[address]', :string, :required, 'Mall Area'
  end

  def create
    @mall = Mall.new(mall_params)
    render json: @mall.errors.full_messages unless @mall.save
  end

  swagger_api :update do
    summary 'Update mall'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Authentication Token'
    param :path, :id, :integer, :required, 'Mall ID'
    param :form, 'mall[name]', :string, :required, 'Mall Name'
    param :form, 'mall[area]', :string, :required, 'Mall Area'
    param :form, 'mall[address]', :string, :required, 'Mall Area'
  end

  def update
    render json: @mall.errors.full_messages unless @mall.update(mall_params)
  end

  swagger_api :index do
    summary 'Get all malls of a city'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Authentication Token'
    param :path, :city_id, :integer, :required, 'City ID'
  end

  def index
    @malls = @city.malls
  end

  swagger_api :destroy do
    summary 'Delete mall'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Authentication Token'
    param :path, :id, :integer, :required, 'Mall ID'
  end

  def destroy
    @mall.destroy
  end

  private

  def mall_params
    params.require(:mall).permit(:city_id, :name, :area, :address)
  end

  def set_mall
    @mall = Mall.find(params[:id])
  end

  def set_city
    @city = City.find(params[:city_id])
  end
end
