class Api::V2::Navbox::OrdersController < Api::V2::Navbox::ApiBaseController
  before_action :authenticate_user_token!, only: %i[show index destroy]
  before_action :set_order, only: %i[show edit update destroy]

  swagger_controller :orders, 'Navbox'

  swagger_api :index do
    summary 'Get all orders for admin or current user'
    notes <<-eos
      Sending `user token` as <b>X-User-Token</b> will return all orders For this user.<br />
    eos
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
  end
  # GET /api/v2/navbox/orders
  # GET /api/v2/navbox/orders.json
  def index
    @orders = Order.where(user_id: @user.id)
  end

  swagger_api :show do
    summary 'Show an order by id'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :required, 'Order ID'
    response :not_found
  end
  # GET /api/v2/navbox/orders/1
  # GET /api/v2/navbox/orders/1.json
  def show; end

  swagger_api :destroy do
    summary 'Deletes an existing Order'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :optional, 'Order Id'
    response :unauthorized
    response :not_found
  end
  # DELETE /api/v2/navbox/orders/1
  # DELETE /api/v2/navbox/orders/1.json
  def destroy
    @order.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find_by!(id: params[:id], user_id: @user.id)
  end

  def authenticate_user_token!
    return if @user = User.find_by(authentication_token: request.headers['X-User-Token'])
    render json: { error: 'unauthorized access' }, status: :unauthorized
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:address, :email, :name, :payment_type, :user_id,
                                  :organization_id)
  end
end
