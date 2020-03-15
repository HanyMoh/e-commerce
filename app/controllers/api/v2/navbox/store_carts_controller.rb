class Api::V2::Navbox::StoreCartsController < Api::V2::Navbox::ApiBaseController
  before_action :set_cart, only: %i[show add_to_cart checkout create_order update destroy increment_or_decrement]
  before_action :set_line_item, only: :increment_or_decrement
  before_action :check_cart, only: :create
  before_action :update_stock, only: :create_order
  before_action :authenticate_user_token!, only: %i[show index checkout create_order]
  before_action :update_user, only: :create_order
  skip_before_action :verify_authenticity_token, only: %i[create show_cart]

  # GET /ipa/ver/sion/two/navbox/store_carts.json
  def index
    @carts = @user.store_carts
  end

  # GET /ipa/ver/sion/two/navbox/store_carts.json
  def show; end

  def show_cart
    @cart = StoreCart.find(session[:cart_id])
  end

  # POST /api/v2/navbox/store_carts
  # POST /ipa/ver/sion/two/navbox/store_carts.json
  def create
    session[:cart_id] = @cart.id
    @cart.line_items.create(cart_params[:line_items_attributes])
  end

  def increment_or_decrement
    new_quantity = @line_item.update_qty(params[:quantity])
    @line_item.update(quantity: new_quantity)
    @line_items = @cart.line_items
  end

  def add_to_cart
    @cart.line_items.create(cart_params[:line_items_attributes])
  end

  def checkout
    @cart.user_id = @user.id
    @cart.update_line_items(@cart.line_items, cart_params[:line_items_attributes])
  end

  def create_order
    @order = Order.new(order_params)
    @order.user = @user
    @order.add_line_items_from_cart(@cart)
    @order.save!
  end

  # DELETE /api/v2/navbox/store_carts/1
  # DELETE /api/v2/navbox/store_carts/1.json
  def destroy
    if params[:line_item_id]
      @cart.line_items.find(params[:line_item_id]).destroy
    else
      @cart.destroy
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = StoreCart.find(params[:id])
  end

  def set_line_item
    @line_item = @cart.line_items.find(params[:line_item_id])
  end

  def update_user
    @user.update(user_params) if user_params
  end

  def update_stock
    @cart.line_items.each do |line_item|
      sub_product = SubProduct.find(line_item.sub_product_id)
      stock = sub_product.stocks.find_by!(shop_id: line_item.shop_id)
      stock.quantity -= line_item.quantity
      stock.save!
    end
  end

  def authenticate_user_token!
    return if @user = User.find_by(authentication_token: request.headers['X-User-Token'])
    render json: { error: 'unauthorized access' }, status: :unauthorized
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cart_params
    params.require(:store_cart).permit(:id, line_items_attributes: %i[id product_id shop_id sub_product_id price quantity])
  end

  def order_params
    # id in permitted paramters is cart id
    params.require(:order).permit(:name, :address, :email, :user_id, :payment_type, :shop_id, :organization_id)
  end

  def user_params
    params.require(:user).permit(:country, :city, :phone_number, :gender)
  end

  def check_cart
    @cart = if cart_params[:id]
              StoreCart.find(cart_params[:id])
            else
              StoreCart.create
            end
  end
end
