class Admin::AppTokensController < Admin::BaseAdminController
  load_and_authorize_resource

  def new; end

  def create
    clean_invalid_tokens
    generate_token
    if @app_token.save
      flash[:notice] = "New token for #{@app_token.platform.titleize} has been created"
      redirect_to admin_app_tokens_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    clean_invalid_tokens
    generate_token
    if @app_token.update(app_token_params)
      flash[:notice] = 'Token has been updated'
      redirect_to admin_app_tokens_path
    else
      render 'edit'
    end
  end

  def index
    @navbox_token = AppToken.find_by(platform: 'navbox')
    @dashboard_token = AppToken.find_by(platform: 'dashboard')
    @mobile_token = AppToken.find_by(platform: 'mobile')
  end

  def toggle_activation
    @app_token.active = if @app_token.active?
                          false
                        else
                          true
                        end
    @app_token.save
  end

  private

  def app_token_params
    if params[:app_token][:token].blank?
      params.require(:app_token).permit(:title, :platform)
    else
      params.require(:app_token).permit(:title, :token, :platform)
    end
  end

  def generate_token
    @app_token.generate_random_token if params[:app_token][:token].blank?
  end

  def clean_invalid_tokens
    AppToken.where(active: true, platform: nil).destroy_all
  end
end
