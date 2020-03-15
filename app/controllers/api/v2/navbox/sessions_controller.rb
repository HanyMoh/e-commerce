class Api::V2::Navbox::SessionsController < Api::V2::Navbox::ApiBaseController
  acts_as_token_authentication_handler_for User, fallback_to_devise: :true,
                                                 only: :destroy

  swagger_controller :sessions, 'Navbox'

  swagger_api :create do
    summary 'Create Session'
    notes <<-eos
      Signin should give you `authentication_token`.<br />
      You should add `authentication_token` and `email` to all upgoing requests
      in header to authenticate your self!<br />
      Header should be like this:</br>
      <b>X-User-Email</b> alice@example.com<br />
      <b>X-User-Token</b> 1G8_s7P-V-4MGojaKD7a<br />
      <br /><br />
    eos
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Authentication Token'
  end

  def create
    user_password = params[:user][:password]
    user_email = params[:user][:email]
    @user = User.find_for_database_authentication(email: user_email)
    if @user
      if @user.valid_password? user_password
        sign_in @user, store: false
        @user.generate_authentication_token!
        @user.save
        render json: { success: true,
                       authentication_token: @user.authentication_token,
                       email: @user.email,
                       user_name: @user.user_name }
      else
        render json: { errors: 'Invalid email or password' }, status: :unprocessable_entity
      end
    else
      render json: { errors: 'You should sign up first' }, status: :unprocessable_entity
    end
  end

  def destroy
    @user = current_user
    @user.generate_authentication_token!
    @user.save
    render json: { success: true, status: 'signed out' }
  end
end
