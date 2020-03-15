class RoleEmployeeUser < ApplicationRecord
  belongs_to :employee_user
  belongs_to :organization_manager, optional: true
  belongs_to :role
end

# == Schema Information
#
# Table name: role_employee_users
#
#  id               :bigint(8)        not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  employee_user_id :integer
#  role_id          :integer
#
