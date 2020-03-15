# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :set_brand_and_shop, only: %i[new create]
  before_action :set_url, only: %i[new create]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    # super
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'You\'ve signed up successfully, Please login to start shopping!'
      redirect_to new_user_session_path
    else
      flash[:error] = @user.errors.full_messages
      render 'new'
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  private

  def set_brand_and_shop
    @brand = Brand.find(cookies[:navbox_brand])
    @shop = Shop.find(cookies[:navbox_shop])
  end

  def set_url
    @navbox_url = request.base_url + '/store/' + (@shop.building ? @shop.building.area.parameterize : @shop.street.parameterize) + '/' + @brand.name.parameterize + '/' + @shop.id.to_s
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :user_name)
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
