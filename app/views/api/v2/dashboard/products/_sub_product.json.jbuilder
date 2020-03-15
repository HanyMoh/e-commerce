json.extract! sub_product, :id, :barcode, :size, :color, :price, :gallery, :quantity
json.brand do 
	json.name sub_product.brand.name if sub_product.brand
end 
json.category do 
	json.name sub_product.product.category.name if sub_product.product.category
end 
json.shop do 
	json.name sub_product.shop.name if sub_product.shop
end 
json.stocks sub_product.stocks do |stock|
	json.partial! 'stock', stock: stock
end 