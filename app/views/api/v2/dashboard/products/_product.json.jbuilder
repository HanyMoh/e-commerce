json.extract! product, :id, :name, :description, :cover_image, :colors, :sizes
json.availability product.num_of_stocks
json.sub_products product.sub_products do |sub_product|
	json.partial! 'sub_product', sub_product: sub_product
end 