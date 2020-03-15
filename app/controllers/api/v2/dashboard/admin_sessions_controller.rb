class Api::V2::Dashboard::AdminSessionsController < Api::V2::Dashboard::ApiBaseController
  acts_as_token_authentication_handler_for Admin, fallback_to_devise: :true,
                                                  only: :destroy
  skip_before_action :authenticate_user, only: :create

  swagger_controller :admin_sessions, 'Dashboard'

  swagger_api :create do
    summary 'sign in To Dashboard as Admin'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :form, 'admin[email]', :email, :required, 'User Email (whether Manager or Employee)'
    param :form, 'admin[password]', :password, :required, 'User password (whether Manager or Employee)'
    response :not_processable
    response :unauthorized
  end
  def create
    admin_password = params[:admin][:password]
    admin_email = params[:admin][:email]
    @admin = Admin.find_for_database_authentication(email: admin_email)
    if @admin
      if @admin.valid_password? admin_password
        sign_in @admin, store: false
        @admin.generate_authentication_token!
        @admin.save
        render json: { success: true,
                       authentication_token: @admin.authentication_token,
                       email: @admin.email,
                       user_name: @admin.name }
      else
        render json: { errors: 'Invalid email or password' }, status: :unprocessable_entity
      end
    else
      render json: { errors: 'You should sign up first' }, status: :unprocessable_entity
    end
  end

  swagger_api :destroy do
    summary 'Sign out'
    param :header, 'X-User-Token', :string, :required, 'Admin Authentication Token'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    response :not_processable
    response :unauthorized
  end

  def destroy
    @admin = current_admin
    @admin.generate_authentication_token!
    @admin.save
    render json: { success: true, status: 'signed out' }
  end
end
