module SyncProduct
  def sync_products(response)
    response.each do |product|
      category = Category.find_by(name: product['ProdCat'])
      main_product = Product.find_by(item_id: product['ItemId'])

      cat = Category.create(name: product['ProdCat']) unless category

      unless main_product
        @product = Product.create(item_id: product['ItemId'],
                                  name: product['ItemName'],
                                  description: product['ItemDesc'],
                                  category: category,
                                  brand: Brand.first,
                                  organization: Organization.first)
      end

      product['ProductLine'].each do |pl|
        # Temporary modification
        sub_product = SubProduct.find_by(item_id: pl['ItemId'])
        unless sub_product
          @pl = SubProduct.create(item_id: pl['ItemId'],
                                  barcode: pl['Barcode'],
                                  product: @product,
                                  size: pl['Size'],
                                  color: pl['Color'],
                                  organization: Organization.first,
                                  brand: Brand.first,
                                  shop: Shop.first)
        end

        # Temporary modifucation
        product_line = SubProduct.find_by(item_id: pl['ItemId'])
        next unless product_line
        @stock = Stock.create(sub_product: product_line,
                              shop: Shop.first,
                              quantity: pl['Qty'].to_i,
                              price: pl['Price'].to_d,
                              discount: pl['Discount'].to_d,
                              location: pl['InventLocationId'],
                              organization: Organization.first)
      end
    end
  end
end
