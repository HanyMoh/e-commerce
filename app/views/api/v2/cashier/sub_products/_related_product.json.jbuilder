json.extract! related_product, :id, :barcode, :size, :color, :price, :gallery, :quantity
json.branch related_product.shop.name 
json.on_360 related_product.popup