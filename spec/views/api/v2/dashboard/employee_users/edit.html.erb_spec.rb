require 'rails_helper'

RSpec.describe 'api/v2/dashboard/employee_users/edit', type: :view do
  before(:each) do
    @api / v2 / dashboard_employee_user = assign(:api / v2 / dashboard_employee_user, Api::V2::Dashboard::EmployeeUser.create!)
  end

  it 'renders the edit api/v2/dashboard_employee_user form' do
    render

    assert_select 'form[action=?][method=?]', api / v2 / dashboard_employee_user_path(@api / v2 / dashboard_employee_user), 'post' do
    end
  end
end
