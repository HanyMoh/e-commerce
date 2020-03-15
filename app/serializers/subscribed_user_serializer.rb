# == Schema Information
#
# Table name: subscribed_users
#
#  id              :bigint(8)        not null, primary key
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint(8)
#  shop_id         :bigint(8)
#
# Indexes
#
#  index_subscribed_users_on_organization_id  (organization_id)
#  index_subscribed_users_on_shop_id          (shop_id)
#
# Foreign Keys
#
#  fk_rails_...  (organization_id => organizations.id)
#  fk_rails_...  (shop_id => shops.id)
#

class SubscribedUserSerializer < ActiveModel::Serializer
  attributes :id
end
