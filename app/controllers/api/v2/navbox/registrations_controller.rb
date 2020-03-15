class Api::V2::Navbox::RegistrationsController < Api::V2::Navbox::ApiBaseController
  swagger_controller :registrations, 'Navbox'

  swagger_api :create do
    summary 'sign in To navbox as User'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :form, 'user[email]', :email, :required, 'User Email '
    param :form, 'user[password]', :password, :required, 'User password '
    param :form, 'user[user_name]', :string, :required, 'Username'
    response :not_processable
    response :unauthorized
  end
  def create
    # super
    @user = User.new(user_params)
    if @user.save
      render json: { success: true,
                     authentication_token: @user.authentication_token,
                     email: @user.email,
                     user_name: @user.user_name }
    else
      render json: @user.errors.full_messages
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :user_name)
  end
end
