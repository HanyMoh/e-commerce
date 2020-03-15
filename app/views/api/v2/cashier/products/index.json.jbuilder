json.array! @products do |product|
  json.partial! 'product', product: product
  json.sub_products product.sub_products do |sub_product|
    json.partial! "sub_product", sub_product: sub_product
  end
end
