class Api::V2::Dashboard::ManagerSessionsController < Api::V2::Dashboard::ApiBaseController
  acts_as_token_authentication_handler_for Manager, fallback_to_devise: :true,
                                                    only: :destroy
  skip_before_action :authenticate_user, only: :create

  swagger_controller :manager_sessions, 'Dashboard'

  swagger_api :create do
    summary 'sign in To Dashboard as Manager'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :form, 'manager[email]', :email, :required, 'User Email'
    param :form, 'manager[password]', :password, :required, 'User password'
    response :not_processable
    response :unauthorized
  end
  def create
    manager_password = params[:manager][:password]
    manager_email = params[:manager][:email]
    @manager = OrganizationManager.find_for_database_authentication(email: manager_email)
    if @manager
      if @manager.valid_password? manager_password
        sign_in @manager, store: false
        @manager.generate_authentication_token!
        @manager.save
        render json: { success: true,
                       authentication_token: @manager.authentication_token,
                       organization_manager_id: @manager.id,
                       email: @manager.email,
                       organization_id: @manager.organization_id,
                       user_name: @manager.name }
      else
        render json: { errors: 'Invalid email or password' }, status: :unprocessable_entity
      end
    else
      render json: { errors: 'You should sign up first' }, status: :unprocessable_entity
    end
  end

  swagger_api :destroy do
    summary 'Sign out'
    param :header, 'X-User-Token', :string, :required, 'User Authentication Token'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    response :not_processable
    response :unauthorized
  end
  def destroy
    @manager = current_manager
    @manager.generate_authentication_token!
    @manager.save
    render json: { success: true, status: 'signed out' }
  end
end
