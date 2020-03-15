class Api::V2::Mobile::ApiBaseController < ApplicationController
  protect_from_forgery with: :null_session, if: proc { |c| c.request.format == 'application/json' }
  respond_to :json
  rescue_from ActiveRecord::RecordNotFound, ActiveRecord::InvalidForeignKey, with: :not_found
  before_action :authenticate_app_token!

  def not_found
    render json: { error: 'object not found, or does not exists' }, status: :not_found
  end

  def current_user
    @current_user ||= User.find_by(authentication_token: request.headers['X-User-Token'])
  end

  def current_employee_user
    @current_employee_user ||= EmployeeUser.find_by(
      authentication_token: request.headers['X-User-Token']
    )
  end

  private

  def authenticate_app_token!
    return if AppToken.where(active: true, platform: 'mobile', token: request.headers['X-APP-TOKEN']).exists?
    render json: { error: 'unauthorized access' }, status: :unauthorized
  end
end
