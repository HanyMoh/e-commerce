json.cart do 
	json.partial! "cart", cart: @cart
unless @cart.line_items.empty? 
  json.line_items @cart.line_items do |item|
    json.partial! 'line_item', line_item: item
  end 
end
end 
if @user 
	json.user do 
	json.partial! 'user', user: @user
end
end	