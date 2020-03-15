json.array! @products do |product|
  json.(product, :id, :name, :p_name, :description, :brand_id, :category_id, :cover_image_url)
  json.p_area @shop.building ? @shop.building.area.parameterize : @shop.street.parameterize if @shop
  json.sub_products do
    json.array! product.sub_products do |sub_product|
      json.(sub_product, :id, :barcode, :size, :color, :cover_image_url)
      json.stocks do
        json.array! sub_product.stocks do |stock|
          json.(stock, :id, :quantity, :shop_id, :location, :price, :discount)
        end
      end
    end
  end
end
