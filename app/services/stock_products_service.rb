class StockProductsService
  attr_reader :errors

  def initialize(products)
    @errors = []
    @products = products
  end

  def call
    @products.each do |product|
      organization = product.organization_id
      main_product = product.id
      product.sub_products.each do |sub_product|
        create_stock_of_sub_product(organization, main_product, sub_product)
      end
    end
  end

  def create_stock_of_sub_product(organization_id, product_id, sub_product)
    stock = Stock.new
    stock.organization_id = organization_id
    stock.shop_id         = sub_product.shop_id
    stock.product_id      = product_id
    stock.sub_product_id  = sub_product.id
    stock.price           = sub_product.price
    stock.quantity        = sub_product.quantity
    stock.discount        = sub_product.discount
    unless stock.save
      msg = "ERORR: product_id->#{product_id} | sub_product_id->#{sub_product.id} FAILED!"
      @errors << msg
    end
  end
end
