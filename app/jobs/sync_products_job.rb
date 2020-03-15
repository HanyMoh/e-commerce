class SyncProductsJob < ApplicationJob
  queue_as :default

  def perform(products)
    cmd = StockProductsService.new(products).call unless products.nil?
    products = nil
    true
  end
end
