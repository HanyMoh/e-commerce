class Api::V2::Dev::ApiBaseController < ApplicationController
  protect_from_forgery with: :null_session, if: proc { |c| c.request.format == 'application/json' }
  respond_to :json
  rescue_from ActiveRecord::RecordNotFound, ActiveRecord::InvalidForeignKey, with: :not_found
  before_action :authenticate_app_token!
  before_action :authenticate_admin

  def not_found
    render json: { error: 'object not found, or does not exists' }, status: :not_found
  end

  def current_admin
    @current_admin ||= Admin.find_by(
      authentication_token: request.headers['X-User-Token']
    )
  end

  private

  def authenticate_app_token!
    return if AppToken.where(active: true, platform: 'dashboard', token: request.headers['X-APP-TOKEN']).exists?
    render json: { error: 'unauthorized access' }, status: :unauthorized
  end

  def authenticate_admin
    return if current_admin
    render json: { error: 'unauthorized access, please re-login as admin' }, status: :unauthorized
  end
end
