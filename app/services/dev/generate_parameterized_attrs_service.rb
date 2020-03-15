class Dev::GenerateParameterizedAttrsService
  def initialize
    @organizations = Organization.all # name
    @shops = Shop.all # name area
    @products = Product.all # name
    @categories = Category.all # name
    @results = { organizations: 0, shops: 0, products: 0, categories: 0 }
  end

  def call
    @organizations.each do |organization|
      organization.p_name = organization.name.parameterize
      @results[:organizations] += 1 if organization.save
    end

    @shops.each do |shop|
      shop.p_name = shop.name.parameterize
      shop.p_area = shop.building ? shop.building&.area&.parameterize : shop.street&.parameterize
      @results[:shops] += 1 if shop.save
    end

    @products.each do |product|
      product.p_name = product.name.parameterize
      @results[:products] += 1 if product.save
    end

    @categories.each do |category|
      category.p_name = category.name.parameterize
      @results[:categories] += 1 if category.save
    end

    @results
  end
end
