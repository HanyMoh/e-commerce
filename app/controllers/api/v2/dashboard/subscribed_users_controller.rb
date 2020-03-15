class Api::V2::Dashboard::SubscribedUsersController < Api::V2::Dashboard::ApiBaseController
  before_action :set_subscribed_user, only: :show

  swagger_controller :sub_products, 'Dashboard'

  swagger_api :index do
    summary 'Get all subscribed users for current admin or manager'
    notes <<-eos
      Sending `manager token` as <b>X-User-Token</b> will return all subscribed users of the current manager organization.<br />
      Sending `admin token` as <b>X-User-Token</b> will return all subscribed users in the system.<br />
    eos
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
  end
  # GET /subscribed_users
  # GET /subscribed_users.json
  def index
    @subscribed_users = if current_manager
                          SubscribedUser.where(organization_id: current_manager.organization_id).newest_first.per_page(:page)
                        else
                          SubscribedUser.newest_first.per_page(:page)
                        end
  end

  swagger_api :show do
    summary 'Show a subscribed user by id'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :required, 'Subscribed user ID'
    response :not_found
  end
  # GET /subscribed_users/1
  # GET /subscribed_users/1.json
  def show; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_subscribed_user
    @subscribed_user = if current_manager
                         SubscribedUser.find_by!(id: params[:id], organization_id: current_manager.organization_id)
                       else
                         SubscribedUser.find(params[:id])
                       end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def subscribed_user_params
    params.require(:subscribed_user).permit(:email, :shop_id, :organization_id)
  end
end
