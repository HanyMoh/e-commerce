module Api::V2::Cashier::SessionsHelper
  def user_type(user)
    if user.class.name == 'EmployeeUser' || user.class.name == 'Manager'
      'EmployeeUser'
    else
      'OrganizationManager'
    end
  end
end
