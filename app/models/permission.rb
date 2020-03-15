class Permission < ApplicationRecord
  has_many :permission_roles, dependent: :destroy
  has_many :roles, through: :permission_roles

  def name
    "Can #{action} #{target_model_name}"
  end
end

# == Schema Information
#
# Table name: permissions
#
#  id                :bigint(8)        not null, primary key
#  action            :string
#  target_model_name :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
