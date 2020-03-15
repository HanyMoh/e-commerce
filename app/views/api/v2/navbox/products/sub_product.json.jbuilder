json.(@sub_product, :id, :barcode, :size, :color)
json.stocks do
  json.array! @sub_product.stocks do |stock|
    json.(stock, :id, :quantity, :price, :discount)
  end
end
