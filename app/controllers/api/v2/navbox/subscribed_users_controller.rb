class Api::V2::Navbox::SubscribedUsersController < Api::V2::Navbox::ApiBaseController
  swagger_controller :subscribed_users, 'Dashboard'

  swagger_api :create do
    summary 'Create Shop'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :form, 'subscribed_user[email]', :string, :required, 'Email'
    param :form, 'subscribed_user[shop_id]', :integer, :required, 'Shop ID'
    param :form, 'subscribed_user[organization_id]', :integer, :required, 'Organization ID'
  end
  def create
    @subscribed_user = SubscribedUser.new(subscribed_user_params)
    render json: @subscribed_user.errors unless @subscribed_user.save
  end

  private

  def subscribed_user_params
    params.require(:subscribed_user).permit(:email, :shop_id, :organization_id)
  end
end
