class Api::V2::Dashboard::CountriesController < Api::V2::Dashboard::ApiBaseController
  before_action :set_country, only: %i[update destroy]

  swagger_controller :countries, 'Dashboard'

  swagger_api :create do
    summary 'Create country'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Authentication Token'
    param :form, 'country[name]', :string, :required, 'Country Name'
  end

  def create
    @country = Country.new(country_params)
    render json: @country.errors.full_messages unless @country.save
  end

  swagger_api :update do
    summary 'Update country'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Authentication Token'
    param :path, :id, :integer, :required, 'Country ID'
    param :form, 'country[name]', :string, :required, 'Country Name'
  end

  def update
    render json: @country.errors.full_messages unless @country.update(country_params)
  end

  swagger_api :index do
    summary 'Get all countries'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Authentication Token'
  end

  def index
    @countries = Country.all
  end

  swagger_api :destroy do
    summary 'Delete country'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Authentication Token'
    param :path, :id, :integer, :required, 'Country ID'
  end

  def destroy
    @country.destroy
  end

  private

  def country_params
    params.require(:country).permit(:name)
  end

  def set_country
    @country = Country.find(params[:id])
  end
end
