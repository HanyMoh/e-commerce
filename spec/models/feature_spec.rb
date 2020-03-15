# == Schema Information
#
# Table name: features
#
#  id              :bigint(8)        not null, primary key
#  beacon          :boolean
#  campaign        :boolean
#  cart            :boolean
#  panorama360     :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint(8)
#
# Indexes
#
#  index_features_on_organization_id  (organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (organization_id => organizations.id)
#

require 'rails_helper'

RSpec.describe Feature, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
