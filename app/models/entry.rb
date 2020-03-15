class Entry < ApplicationRecord
  belongs_to :pocket
  belongs_to :sub_product, optional: true
  belongs_to :order, optional: true
  belongs_to :shop, optional: true

  scope :newest_first, -> { order('created_at desc') }

  def total_price
    if price.nil? || quantity.nil?
      0
    else
      price * quantity
    end
  end

  def update_qty(val)
    quantity + val.to_i
  end
end
