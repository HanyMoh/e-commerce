class Api::V2::Navbox::PocketsController < Api::V2::Navbox::ApiBaseController
  before_action :set_pocket, only: %i[show add_to_pocket checkout create_order update destroy increment_or_decrement]
  before_action :set_entry, only: :increment_or_decrement
  before_action :check_pocket, only: :create
  before_action :update_stock, only: :create_order
  before_action :authenticate_user_token!, only: %i[show index checkout create_order]
  before_action :update_user, only: :create_order
  skip_before_action :verify_authenticity_token, only: %i[create show_pocket]

  # GET /ipa/ver/sion/two/navbox/store_carts.json
  def index
    @pockets = @user.pockets
  end

  # GET /ipa/ver/sion/two/navbox/store_carts.json
  def show; end

  def show_pocket
    @pocket = Pocket.find(session[:pocket_id])
  end

  # POST /api/v2/navbox/store_carts
  # POST /ipa/ver/sion/two/navbox/store_carts.json
  def create
    session[:pocket_id] = @pocket.id
    @pocket.entries.create(pocket_params[:entries_attributes])
  end

  def increment_or_decrement
    new_quantity = @entry.update_qty(params[:quantity])
    @entry.update(quantity: new_quantity)
    @entries = @pocket.entries
  end

  def add_to_pocket
    @pocket.entries.create(pocket_params[:entries_attributes])
  end

  def checkout
    @pocket.user_id = @user.id
    @pocket.update_entries(@pocket.entries, pocket_params[:entries_attributes])
  end

  def create_order
    @order = Order.new(order_params)
    @order.user = @user
    @order.add_entries_from_pocket(@pocket)
    @order.save!
  end

  # DELETE /api/v2/navbox/store_carts/1
  # DELETE /api/v2/navbox/store_carts/1.json
  def destroy
    if params[:entry_id]
      @pocket.entries.find(params[:entry_id]).destroy
    else
      @pocket.destroy
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pocket
    @pocket = Pocket.find(params[:id])
  end

  def set_entry
    @entry = @pocket.entries.find(params[:entry_id])
  end

  def update_user
    @user.update(user_params) if user_params
  end

  def update_stock
    @pocket.entries.each do |entry|
      sub_product = SubProduct.find(entry.sub_product_id)
      stock = sub_product.stocks.find_by!(shop_id: entry.shop_id)
      stock.quantity -= entry.quantity
      stock.save!
    end
  end

  def authenticate_user_token!
    return if @user = User.find_by(authentication_token: request.headers['X-User-Token'])
    render json: { error: 'unauthorized access' }, status: :unauthorized
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def pocket_params
    params.require(:pocket).permit(:id, entries_attributes: %i[id shop_id sub_product_id price quantity])
  end

  def order_params
    params.require(:order).permit(:name, :shop_id, :address, :email, :user_id, :payment_type, :organization_id)
  end

  def user_params
    params.require(:user).permit(:country, :city, :phone_number, :gender)
  end

  def check_pocket
    @pocket = if pocket_params[:id]
                Pocket.find(pocket_params[:id])
              else
                Pocket.create
            end
  end
end
