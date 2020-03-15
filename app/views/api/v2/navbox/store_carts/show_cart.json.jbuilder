json.partial! "cart", cart: @cart
unless @cart.line_items.empty? 
  json.line_items @cart.line_items do |item|
    json.partial! 'line_item', line_item: item
  end 
end
