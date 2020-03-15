class ProductsUpdateJob < ApplicationJob
  queue_as :default

  def perform(file, params, action)
    if action == 'validate'
      Dashboard::ProductsImportService.new.validate(file, params)
    elsif action == 'update'
      Dashboard::ProductsUpdateService.new.update(file, params)
    end
  end
end
