json.extract! stock, :id, :quantity, :price, :discount
json.shop do 
	json.name stock.shop.name
end 
json.product do 
	json.id stock.product.id 
	json.name stock.product.name
end 
json.sub_product do 
	json.id stock.product.id 
	json.name stock.product.name
end 
json.organization do 
	json.id stock.organization.id 
	json.name stock.organization.name
end 