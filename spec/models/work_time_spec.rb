# == Schema Information
#
# Table name: work_times
#
#  id              :bigint(8)        not null, primary key
#  closing_at      :datetime
#  fri             :boolean
#  mon             :boolean
#  opening_at      :datetime
#  sat             :boolean
#  sun             :boolean
#  thu             :boolean
#  tue             :boolean
#  wed             :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint(8)
#  shop_id         :bigint(8)
#
# Indexes
#
#  index_work_times_on_organization_id  (organization_id)
#  index_work_times_on_shop_id          (shop_id)
#
# Foreign Keys
#
#  fk_rails_...  (organization_id => organizations.id)
#  fk_rails_...  (shop_id => shops.id)
#

require 'rails_helper'

RSpec.describe WorkTime, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
