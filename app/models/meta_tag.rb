class MetaTag < ApplicationRecord
  belongs_to :shop, optional: true
  belongs_to :product, optional: true

  scope :newest_first, -> { order('created_at desc') }
end
