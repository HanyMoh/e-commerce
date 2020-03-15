class Api::V2::Navbox::SocialMediaController < Api::V2::Navbox::ApiBaseController
  def create
    @user = User.from_omniauth(construct_authhash, 'api')
    if @user.persisted?
      sign_in @user
      @user.email = nil if @user.email.partition('@').last == 'nasnav.com'
    else
      render json: { errors: @user.errors }, status: :bad_request
    end
  end

  private

  def construct_authhash
    OmniAuth::AuthHash.new(uid: permitted_params[:uid], user_name: permitted_params[:user_name], provider: permitted_params[:provider],
                           info: { email: permitted_params.fetch(:email, nil), image: permitted_params.fetch(:avatar, nil) })
  end

  def permitted_params
    params.require(:user).permit(:email, :user_name, :provider, :uid, :avatar)
  end
end
