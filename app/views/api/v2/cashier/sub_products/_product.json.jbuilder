json.extract! product, :id, :name, :description, :cover_image_url
json.brand product.brand.name
json.category product.category.name