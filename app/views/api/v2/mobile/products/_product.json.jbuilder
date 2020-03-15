json.(product, :id, :name, :p_name, :description, :category_id, :organization_id, :item_id, :cover_image_url)
json.p_area @shop.building ? @shop.building.area.parameterize : @shop.street.parameterize if @shop
json.sub_products do
  json.array! product.sub_products do |sub_product|
    json.(sub_product, :id, :barcode, :size, :color, :gallery_urls) 
    json.stocks do
      json.array! sub_product.stocks do |stock|
        json.(stock, :id, :shop_id, :quantity, :price, :discount)
        json.shop_name stock.shop.name
        json.mall stock.shop.mall.name if stock.shop.mall
        json.mall_id stock.shop.mall.id if stock.shop.mall
        json.address stock.shop.mall ? stock.shop.mall.address : stock.shop.street
        json.lat stock.shop.mall ? 'coming soon' : stock.shop.lat
        json.lng stock.shop.mall ? 'coming soon' : stock.shop.lng
      end
    end
  end
end
