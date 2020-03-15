class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :set_authenticated_user, only: %i[facebook google_oauth2]
  def facebook
    if @user.persisted?
      navigate_to_shop
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def google_oauth2
    if @user.persisted?
      navigate_to_shop
    else
      # Removing extra as it can overflow some session stores
      session['devise.google_data'] = request.env['omniauth.auth'].except(:extra)
      redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    end
  end

  def failure
    redirect_to root_path
  end

  private

  def set_authenticated_user
    @user = User.from_omniauth(request.env['omniauth.auth'], 'web')
  end

  def navigate_to_shop
    sign_in(@user, scope: :user)
    redirect_to cookies[:navbox_url]
  end
end
