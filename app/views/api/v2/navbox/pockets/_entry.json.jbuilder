json.extract! entry, :id, :price, :quantity
json.total_price entry.total_price
json.product do 
	json.partial! 'product', product: entry.sub_product.product
end 
json.sub_product do 
    json.partial! 'sub_product', sub_product: entry.sub_product
end