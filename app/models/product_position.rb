class ProductPosition < ApplicationRecord
  serialize :positions_json_data
  serialize :preview_json_data

  belongs_to :shop360
end
