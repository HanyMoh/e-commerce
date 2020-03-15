class ImportSubProductGalleryJob < ApplicationJob
  queue_as :default

  def perform(params, sub_product)
    Dashboard::ImportSubProductGalleryService.new.import(params, sub_product)
  end
end
