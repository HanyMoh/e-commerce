module CurrentCart
  private

  def set_cart
    @store_cart = StoreCart.find(session[:store_cart_id])
  rescue ActiveRecord::RecordNotFound
    @store_cart = StoreCart.create
    session[:store_cart_id] = @store_cart.id
  end
end
