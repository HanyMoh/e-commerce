class ApisController < ApplicationController
  skip_before_action :verify_authenticity_token
  layout 'api'

  def index; end

  def check
    developer = Developer.find_by(password: Digest::MD5.hexdigest(params[:password]))
    if developer
      session[:developer_id] = developer.id
    else
      flash[:error] = 'Unauthorized access'
    end
    redirect_to api_path
  end
end
