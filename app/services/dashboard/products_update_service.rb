class Dashboard::ProductsUpdateService
  def initialize
    # @categories_list = Category.pluck(:name, :id).map { |name, id| [name.strip.downcase, id] }.to_h
    @row_num = 2
    @errors = []
    @products = []
    @sub_products = []
    @stocks = []
    @results = { products: 0, sub_products: 0, stocks: 0 }
  end

  def update(file, params)
    @organization = Organization.find(params[:organization_id])
    @brand = Brand.find(params[:brand_id])

    update_products(file, params)
    update_sub_products(file, params)
    update_stocks(file, params)

    @results
  end

  private

  def update_products(file, params)
    updated_products = 0
    CSV.foreach(file, headers: true) do |row|
      data = row.to_h
      category = nil
      row['category'].split(',').map do |cat|
        category = Category.find_by(name: cat) 
      end
      product_data = data.slice('name', 'description')
      product = SubProduct.find_by(barcode: row['barcode'], organization_id: params[:organization_id], brand_id: params[:brand_id]).product

      product.name = product_data['name'].strip.squeeze.downcase if params[:attrs].include?('name')
      product.p_name = product_data['name'].strip.squeeze.downcase.parameterize if params[:attrs].include?('name')
      if params[:attrs].include?('description')
        product.description = if product_data['description'].nil?
                                product_data['name'].strip.squeeze
                              else
                                product_data['description']
                              end
      end
      product.item_id = row['item_id'] if params[:attrs].include?('item_id')
      product.category_id = category.id if params[:attrs].include?('category')

      if product.valid? && product.changed?
        product.save
        updated_products += 1
      end
    end

    @results[:products] = updated_products
  end

  def update_sub_products(file, params)
    updated_sub_products = 0
    CSV.foreach(file, headers: true) do |row|
      category = nil
      row['category'].split(',').map do |cat|
        category = Category.find_by(name: cat)
      end
      sub_product = SubProduct.find_by(barcode: row['barcode'].strip, brand_id: params[:brand_id], organization_id: params[:organization_id])

      sub_product.item_id = row['item_id'] if params[:attrs].include?('item_id')
      sub_product.color = row['color'] if params[:attrs].include?('color')
      sub_product.size = row['size'] if params[:attrs].include?('size')

      if sub_product.valid? && sub_product.changed?
        sub_product.save
        updated_sub_products += 1
      end
    end

    @results[:sub_products] = updated_sub_products
  end

  def update_stocks(file, params)
    updated_stocks = 0
    CSV.foreach(file, headers: true) do |row|
      data = row.to_h
      category = nil
      row['category'].split(',').map do |cat|
        category = Category.find_by(name: cat)
      end

      product = Product.where('lower(name) = ?', row['name'].strip.squeeze.downcase).where(category: category, organization: @organization, brand: @brand).first
      sub_product = SubProduct.where(barcode: row['barcode'].strip, product: product, organization: @organization, brand: @brand).first
      shop_quantities = row.select { |key, _value| key.include?('shop_') }.to_h
      shop_quantities.map do |key, value|
        shop = Shop.where(id: key.delete('shop_').to_i).first
        next unless shop
        stock = Stock.where(sub_product: sub_product, product: product, shop: shop, organization: @organization).first
        if stock
          stock.price = row['price'] if params[:attrs].include?('price')
          stock.discount = row['discount'] if params[:attrs].include?('discount')
          stock.quantity = value.to_i if params[:attrs].include?('quantity')
        end

        if stock.valid? && stock.changed?
          stock.save
          updated_stocks += 1
        end
      end
    end

    @results[:stocks] = @stocks.count
  end
end
