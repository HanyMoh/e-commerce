class ProductsImportJob < ApplicationJob
  queue_as :default

  def perform(file, params, action)
    if action == 'validate'
      Dashboard::ProductsImportService.new.validate(file, params)
    elsif action == 'import'
      Dashboard::ProductsImportService.new.import(file, params)
    end
  end
end
