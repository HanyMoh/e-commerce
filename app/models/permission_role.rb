class PermissionRole < ApplicationRecord
  belongs_to :permission
  belongs_to :role
end

# == Schema Information
#
# Table name: permission_roles
#
#  id            :bigint(8)        not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  permission_id :integer
#  role_id       :integer
#
