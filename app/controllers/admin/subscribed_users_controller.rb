class Admin::SubscribedUsersController < Admin::BaseAdminController
  load_and_authorize_resource except: :create
  skip_authorization_check only: :create
  skip_before_action :authenticate, only: :create

  before_action :set_subscribed_user, only: :show
  before_action :check_current_user, only: :index
  layout 'main'

  # GET /subscribed_users
  # GET /subscribed_users.json
  def index; end

  # GET /subscribed_users/1
  # GET /subscribed_users/1.json
  def show; end

  # POST /subscribed_users
  # POST /subscribed_users.json
  def create
    @subscribed_user = SubscribedUser.new(subscribed_user_params)
    @subscribed_user.save!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_subscribed_user
    @subscribed_user = SubscribedUser.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def subscribed_user_params
    params.require(:subscribed_user).permit(:email, :shop_id, :organization_id)
  end

  def check_current_user
    @subscribed_users = if !current_admin
                          SubscribedUser.where(organization: current_active_user.organization)
                                        .per_page(params[:page])
                        else
                          SubscribedUser.all.per_page(params[:page])
                        end
  end
end
