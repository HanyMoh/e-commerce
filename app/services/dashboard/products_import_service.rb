class Dashboard::ProductsImportService
  def initialize
    # @categories_list = Category.pluck(:name, :id).map { |name, id| [name.strip.downcase, id] }.to_h
    @row_num = 2
    @errors = []
    @products = []
    @sub_products = []
    @stocks = []
    @results = { products: 0, sub_products: 0, stocks: 0 }
  end

  def validate(file, params)
    @brand = Brand.find(params[:brand_id])
    CSV.foreach(file, headers: true) do |row|
      row = row.to_h
      shop_quantities = row.select { |key, _value| key.include?('shop_') }
      row_categories = row['category']&.split(',')

      @errors << "Barcode on row #{@row_num} is missing" if row['barcode'].nil?
      @errors << "Barcode on row #{@row_num} is invalid" if !Product::BARCODE_REGEX.match?(row['barcode']&.strip) && !row['barcode'].nil?
      @errors << "Category on row #{@row_num} is missing" if row['category'].nil?
      row_categories.map do |row_category|
        @errors << "Category #{row_category} on row #{@row_num} does not exist, Please contact Nasnav Administrators" if !@brand.category.descendants.pluck(:name).include?(row_category) && !row['category'].nil?
      end
      @errors << "Missing name on row #{@row_num}" if row['name'].nil? || row['name'].squeeze == ' '
      @errors << "Price on row #{@row_num} is zero or invalid" if row['price'].to_f.zero?
      shop_quantities.map do |key, value|
        @errors << "Quanitity on row #{@row_num}, Shop ##{key.delete('shop_')} is not a valid number" if !value.nil? && value.to_i.negative?
      end
      @row_num += 1
    end

    @errors
  end

  def import(file, params)
    @organization = Organization.find(params[:organization_id])
    @brand = Brand.find(params[:brand_id])

    create_products(file)
    create_sub_products(file)
    create_stocks(file)

    @results
  end

  private

  def create_products(file)
    CSV.foreach(file, headers: true) do |row|
      data = row.to_h
      category = nil
      row['category'].split(',').map do |cat|
        category = Category.find_by(name: cat) 
      end
      product_data = data.slice('name', 'description')

      product_data[:name] = product_data['name'].strip.squeeze.downcase
      product_data[:p_name] = product_data['name'].strip.squeeze.downcase.parameterize
      product_data[:description] = if product_data['description'].nil?
                                     product_data['name'].strip.squeeze
                                   else
                                     product_data['description']
                                   end
      product_data[:item_id] = row['item_id']
      product_data[:category_id] = category.id
      product_data[:organization_id] = @organization.id
      product_data[:brand_id] = @brand.id
      new_product = Product.new(product_data)
      products_name_cat = @products.pluck(:name, :category_id)
      @products << new_product if new_product.valid? && !products_name_cat.include?([new_product.name, new_product.category_id])
    end

    Product.import(@products)
    @results[:products] = @products.count
  end

  def create_sub_products(file)
    CSV.foreach(file, headers: true) do |row|
      data = row.to_h
      category = nil
      row['category'].split(',').map do |cat|
        category = Category.find_by(name: cat)
      end
      product = Product.where('lower(name) = ?', row['name'].strip.squeeze.downcase)
                       .where(category: category, organization: @organization, brand: @brand).first
      next if SubProduct.where(barcode: row['barcode'], product: product, organization: @organization, brand: @brand).any?
      sub_product_data = data.slice('barcode', 'color', 'size')

      sub_product_data[:item_id] = row['item_id']
      sub_product_data[:product_id] = product.id
      sub_product_data[:organization_id] = @organization.id
      sub_product_data[:brand_id] = @brand.id
      new_sub_product = SubProduct.new(sub_product_data)
      @sub_products << new_sub_product if new_sub_product.valid?
    end

    SubProduct.import(@sub_products)
    @results[:sub_products] = @sub_products.count
  end

  def create_stocks(file)
    CSV.foreach(file, headers: true) do |row|
      data = row.to_h
      category = nil
      row['category'].split(',').map do |cat|
        category = Category.find_by(name: cat)
      end
      product = Product.where('lower(name) = ?', row['name'].strip.squeeze.downcase).where(category: category, organization: @organization, brand: @brand).first
      sub_product = SubProduct.where(barcode: row['barcode'], product: product, organization: @organization, brand: @brand).first
      shop_quantities = row.select { |key, _value| key.include?('shop_') }.to_h
      shop_quantities.map do |key, value|
        shop_id = key.delete('shop_').to_i
        stock = Stock.where(sub_product: sub_product, product: product, shop_id: shop_id, organization: @organization).first
        if stock
          stock.update(quantity: value.to_i, price: row['price'].to_d, discount: row['discount'].to_d)
        else
          stock_data = data.slice('price', 'discount')
          stock_data[:shop_id] = shop_id
          stock_data[:quantity] = value.to_i
          stock_data[:sub_product_id] = sub_product.id
          stock_data[:product_id] = product.id
          stock_data[:organization_id] = @organization.id
          new_stock = Stock.new(stock_data)
          @stocks << new_stock if new_stock.valid?
        end
      end
    end

    Stock.import(@stocks)
    @results[:stocks] = @stocks.count
  end
end
