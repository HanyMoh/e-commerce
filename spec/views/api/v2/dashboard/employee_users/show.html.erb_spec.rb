require 'rails_helper'

RSpec.describe 'api/v2/dashboard/employee_users/show', type: :view do
  before(:each) do
    @api / v2 / dashboard_employee_user = assign(:api / v2 / dashboard_employee_user, Api::V2::Dashboard::EmployeeUser.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
