class AddSubProductIdToLineItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :line_items, :sub_product, index: true, foreign_key: true
  end
end
