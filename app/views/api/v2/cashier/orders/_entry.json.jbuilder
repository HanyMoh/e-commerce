json.extract! entry, :id, :price, :pocket_id, :quantity
json.sub_product do 
	json.partial! "sub_product", sub_product: entry.sub_product
end 