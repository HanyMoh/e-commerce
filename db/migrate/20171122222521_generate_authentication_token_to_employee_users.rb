class GenerateAuthenticationTokenToEmployeeUsers < ActiveRecord::Migration[5.1]
  def change
    EmployeeUser.all.each do |employee_user|
      employee_user.generate_authentication_token!
      employee_user.save
    end
  end
end
