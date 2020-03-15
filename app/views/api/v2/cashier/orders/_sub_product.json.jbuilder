if sub_product 
	json.extract! sub_product, :id, :barcode, :size, :color, :price, :gallery, :quantity
	json.name sub_product.product.name
	json.category sub_product.product.category.name
	json.on_360 sub_product.popup
end