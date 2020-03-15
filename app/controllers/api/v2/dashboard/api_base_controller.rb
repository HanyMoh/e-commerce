class Api::V2::Dashboard::ApiBaseController < ApplicationController
  protect_from_forgery with: :null_session, if: proc { |c| c.request.format == 'application/json' }
  respond_to :json
  rescue_from ActiveRecord::RecordNotFound, ActiveRecord::InvalidForeignKey, with: :not_found
  before_action :authenticate_app_token!
  before_action :authenticate_user

  def not_found
    render json: { error: 'object not found, or does not exists' }, status: :not_found
  end

  def current_manager
    @current_manager ||= OrganizationManager.find_by(
      authentication_token: request.headers['X-User-Token']
    )
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

  def authenticate_user
    return if current_admin || current_manager
    render json: { error: 'unauthorized access, please re-login' }, status: :unauthorized
  end
end
