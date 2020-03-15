class Api::V2::Dashboard::DevelopersController < Api::V2::Dashboard::ApiBaseController
  before_action :set_developer, only: %i[show edit update destroy]

  swagger_controller :developers, 'Dashboard'

  swagger_api :index do
    summary 'Get all developers'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
  end
  # GET /api/v2/dashboard/developers
  # GET /api/v2/dashboard/developers.json
  def index
    @developers = Developer.all
  end

  swagger_api :show do
    summary 'Show a developer by id'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :required, 'Developer ID'
    response :not_found
  end
  # GET /api/v2/dashboard/developers/1
  # GET /api/v2/dashboard/developers/1.json
  def show; end

  swagger_api :create do
    summary 'Create Developer'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :form, 'developer[name]', :string, :required, 'developer name'
    param :form, 'developer[password]', :string, :required, 'developer password'
  end
  # POST /api/v2/dashboard/developers
  # POST /api/v2/dashboard/developers.json
  def create
    @developer = Developer.new(developer_params)
    render json: @developer.errors unless @developer.save
  end

  swagger_api :update do
    summary 'Update developer'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Authentication Token'
    param :path, :id, :integer, :required, 'Developer ID'
    param :form, 'developer[name]', :string, :required, 'developer name'
    param :form, 'developer[password]', :string, :required, 'developer password'
  end
  # PATCH/PUT /api/v2/dashboard/developers/1
  # PATCH/PUT /api/v2/dashboard/developers/1.json
  def update
    render json: @developer.errors unless @developer.update(developer_params)
  end

  swagger_api :destroy do
    summary 'Deletes an existing Developer'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :optional, 'Category Id'
    response :unauthorized
    response :not_found
  end
  # DELETE /api/v2/dashboard/developers/1
  # DELETE /api/v2/dashboard/developers/1.json
  def destroy
    @developer.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_developer
    @developer = Developer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def developer_params
    params.require(:developer).permit(:name, :password)
  end
end
