class Api::V2::Dashboard::AppTokensController < Api::V2::Dashboard::ApiBaseController
  before_action :set_app_token, only: %i[show edit update destroy]

  # GET /api/v2/dashboard/app_tokens
  # GET /api/v2/dashboard/app_tokens.json
  def index
    @app_tokens = AppToken.all
  end

  # GET /api/v2/dashboard/app_tokens/1
  # GET /api/v2/dashboard/app_tokens/1.json
  def show; end

  # POST /api/v2/dashboard/app_tokens
  # POST /api/v2/dashboard/app_tokens.json
  def create
    @app_token = AppToken.new(app_token_params)
    render json: @app_token.errors unless @app_token.save
  end

  # PATCH/PUT /api/v2/dashboard/app_tokens/1
  # PATCH/PUT /api/v2/dashboard/app_tokens/1.json
  def update
    render json: @app_token.errors unless @app_token.update(app_token_params)
  end

  # DELETE /api/v2/dashboard/app_tokens/1
  # DELETE /api/v2/dashboard/app_tokens/1.json
  def destroy
    @app_token.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_app_token
    @app_token = AppToken.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def app_token_params
    params.require(:app_token).permit(:title, :token, :platform, :active)
  end
end
