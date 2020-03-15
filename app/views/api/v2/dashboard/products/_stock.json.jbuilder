json.extract! stock, :id, :quantity, :price, :discount
json.shop do 
	json.name stock.shop.name
end 