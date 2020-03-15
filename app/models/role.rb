class Role < ApplicationRecord
  validate :validate_employees_organization

  has_many :role_employee_users, dependent: :destroy
  has_many :permission_roles, dependent: :destroy
  has_many :employee_users, through: :role_employee_users
  has_many :permissions, through: :permission_roles
  belongs_to :organization # Confirmed

  def validate_employees_organization
    if employee_users.any? { |employee_user| employee_user.organization_id != organization_id }
      errors.add(:employee_users, "can't be from another organization!")
    end
  end
end

# == Schema Information
#
# Table name: roles
#
#  id              :bigint(8)        not null, primary key
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint(8)
#
# Indexes
#
#  index_roles_on_organization_id  (organization_id)
#
