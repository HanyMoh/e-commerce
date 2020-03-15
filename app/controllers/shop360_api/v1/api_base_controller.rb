class Shop360Api::V1::ApiBaseController < ApplicationController
  respond_to :json
  rescue_from ActiveRecord::RecordNotFound, ActiveRecord::InvalidForeignKey, with: :not_found

  def not_found
    render json: { error: 'object not found' }, status: :not_found
  end

  def current_employee_user
    @current_employee_user ||= EmployeeUser.find_by(authentication_token:
                                                    request.headers['X-User-Token'])
  end

  def current_ability
    @current_ability ||= Ability.new(current_employee_user)
  end
end
