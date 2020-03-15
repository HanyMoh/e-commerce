require 'rails_helper'

RSpec.describe 'api/v2/dashboard/employee_users/index', type: :view do
  before(:each) do
    assign(:api_v2_dashboard_employee_users, [
             Api::V2::Dashboard::EmployeeUser.create!,
             Api::V2::Dashboard::EmployeeUser.create!
           ])
  end

  it 'renders a list of api/v2/dashboard/employee_users' do
    render
  end
end
