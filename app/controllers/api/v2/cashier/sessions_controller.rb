class Api::V2::Cashier::SessionsController < Api::V2::Cashier::ApiBaseController
  acts_as_token_authentication_handler_for EmployeeUser, fallback_to_devise: :true,
                                                         only: :destroy
  before_action :set_user

  skip_before_action :authenticate_user

  swagger_api :create do
    summary 'sign in To Cashier App as (Employee User or Manager)'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :form, 'user[email]', :email, :required, 'User Email (whether Manager or Employee)'
    param :form, 'user[password]', :password, :required, 'User password (whether Manager or Employee)'
    response :not_processable
    response :unauthorized
  end
  def create
    user_password = params[:user][:password]
    user_email = params[:user][:email]
    @user = EmployeeUser.find_for_database_authentication(email: user_email)
    @user ||= OrganizationManager.find_for_database_authentication(email: user_email)
    if @user
      if @user.valid_password? user_password
        sign_in @user, store: false
        @user.generate_authentication_token!
        @user.save!
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
    @user = current_employee
    @user.generate_authentication_token!
    @user.save
    render json: { success: true, status: 'signed out' }
  end

  swagger_api :forget_password do
    summary 'send email instructions for forget password '
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :form, 'user[email]', :email, :required, 'User Email'
  end

  def forget_password
    if @user.present?
      # @employee_user.send_reset_password_instructions
      render json: { message: 'password reset instruction was sent to your mail' }, status: :ok
    else
      render json: { message: 'This email not found' }, status: :not_found
    end
  end

  def update_password
    render json: @user.errors unless @user.update(user_params)
  end

  private

  def set_user
    @user = EmployeeUser.find_for_database_authentication(email: user_params[:email])
    @user ||= OrganizationManager.find_for_database_authentication(email: user_params[:email])
  end

  def user_params
    params.require(:user).permit(:id, :email, :password, :password_confirmation)
  end
end
