class Stock < ApplicationRecord
  # after_commit :update_attrs

  belongs_to :shop
  belongs_to :product, optional: true
  belongs_to :sub_product
  belongs_to :organization

  validates :price, :discount, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

  scope :newest_first, -> { order('created_at desc') }

  def update_attrs
    self.product_id = sub_product.product_id
    self.save
  end
end
