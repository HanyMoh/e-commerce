json.extract! line_item, :id, :price, :quantity
json.total_price line_item.total_price
json.product do 
	json.partial! 'product', product: line_item.sub_product.product
end 
json.sub_product do 
    json.partial! 'sub_product', sub_product: line_item.sub_product
end