# == Schema Information
#
# Table name: timeframes
#
#  id              :bigint(8)        not null, primary key
#  days            :string
#  description     :string
#  end_time        :string
#  name            :string
#  start_time      :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  campaign_id     :bigint(8)
#  organization_id :bigint(8)
#  remote_id       :integer
#
# Indexes
#
#  index_timeframes_on_campaign_id      (campaign_id)
#  index_timeframes_on_organization_id  (organization_id)
#

class TimeframeSerializer < ActiveModel::Serializer
  attributes :name, :start_time, :end_time
end
