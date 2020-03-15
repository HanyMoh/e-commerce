class Api::V2::Dashboard::CitiesController < Api::V2::Dashboard::ApiBaseController
  before_action :set_city, only: %i[update destroy]
  before_action :set_country, only: :index

  swagger_controller :cities, 'Dashboard'

  swagger_api :create do
    summary 'Create city'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Authentication Token'
    param :form, 'city[country_id]', :integer, :required, 'Country ID'
    param :form, 'city[name]', :string, :required, 'City Name'
  end

  def create
    @city = City.new(city_params)
    render json: @city.errors.full_messages unless @city.save
  end

  swagger_api :update do
    summary 'Update city'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Authentication Token'
    param :path, :id, :integer, :required, 'City ID'
    param :form, 'city[name]', :string, :required, 'City Name'
  end

  def update
    render json: @city.errors.full_messages unless @city.update(city_params)
  end

  swagger_api :index do
    summary 'Get all cities of a country'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Authentication Token'
    param :path, :country_id, :integer, :required, 'Country ID'
  end

  def index
    @cities = @country.cities
  end

  swagger_api :destroy do
    summary 'Delete city'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Authentication Token'
    param :path, :id, :integer, :required, 'City ID'
  end

  def destroy
    @city.destroy
  end

  private

  def city_params
    params.require(:city).permit(:country_id, :name)
  end

  def set_city
    @city = City.find(params[:id])
  end

  def set_country
    @country = Country.find(params[:country_id])
  end
end
