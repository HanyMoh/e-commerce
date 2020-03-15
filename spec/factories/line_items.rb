# == Schema Information
#
# Table name: line_items
#
#  id             :bigint(8)        not null, primary key
#  price          :decimal(10, 2)
#  quantity       :integer          default(1)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  order_id       :bigint(8)
#  product_id     :bigint(8)
#  shop_id        :bigint(8)
#  store_cart_id  :bigint(8)
#  sub_product_id :bigint(8)
#
# Indexes
#
#  index_line_items_on_order_id        (order_id)
#  index_line_items_on_product_id      (product_id)
#  index_line_items_on_shop_id         (shop_id)
#  index_line_items_on_store_cart_id   (store_cart_id)
#  index_line_items_on_sub_product_id  (sub_product_id)
#
# Foreign Keys
#
#  fk_rails_...  (order_id => orders.id)
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (shop_id => shops.id)
#  fk_rails_...  (store_cart_id => store_carts.id)
#  fk_rails_...  (sub_product_id => sub_products.id)
#

FactoryBot.define do
  factory :line_item do
    product
    price { Faker::Commerce.price(5..1000.0, false) }
    order
    quantity { Faker::Number.between(1, 100) }
    store_cart
  end
end
