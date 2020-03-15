json.partial! "product", product: @sub_product.product
json.sub_products do 
	json.partial! "sub_product", sub_product: @sub_product
end
json.related_products @related_products do |related_product| 
	json.partial! 'related_product', related_product: related_product
end