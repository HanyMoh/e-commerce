# == Schema Information
#
# Table name: buildings
#
#  id              :bigint(8)        not null, primary key
#  address         :text
#  area            :string
#  banner          :string
#  building_type   :string
#  close_at        :time
#  description     :text
#  floors_count    :integer          default(0)
#  latitude        :decimal(10, 6)
#  logo            :string
#  longitude       :decimal(10, 6)
#  name            :string
#  open_at         :time
#  p_name          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint(8)
#
# Indexes
#
#  index_buildings_on_organization_id  (organization_id)
#

require 'rails_helper'

RSpec.describe Building, type: :model do
end
