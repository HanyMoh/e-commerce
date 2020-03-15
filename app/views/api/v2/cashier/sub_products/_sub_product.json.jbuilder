json.extract! sub_product, :id, :barcode, :size, :color, :price, :gallery, :quantity
json.branch sub_product.shop.name
json.on_360 sub_product.popup