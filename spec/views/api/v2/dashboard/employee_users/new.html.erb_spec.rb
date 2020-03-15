require 'rails_helper'

RSpec.describe 'api/v2/dashboard/employee_users/new', type: :view do
  before(:each) do
    assign(:api / v2 / dashboard_employee_user, Api::V2::Dashboard::EmployeeUser.new)
  end

  it 'renders new api/v2/dashboard_employee_user form' do
    render

    assert_select 'form[action=?][method=?]', api_v2_dashboard_employee_users_path, 'post' do
    end
  end
end
