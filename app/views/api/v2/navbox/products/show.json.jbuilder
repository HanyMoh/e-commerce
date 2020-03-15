json.(@product, :id, :name, :p_name, :description, :category_id, :organization_id, :item_id, :cover_image_url)
json.p_area @shop.building ? @shop.building.area.parameterize : @shop.street.parameterize if @shop
json.sub_products do
  json.array! @product.sub_products do |sub_product|
    json.(sub_product, :id, :barcode, :size, :color, :gallery_urls) 
    json.stocks do
      json.array! sub_product.stocks do |stock|
        json.(stock, :id, :shop_id, :quantity, :price, :discount)
      end
    end
  end
end
