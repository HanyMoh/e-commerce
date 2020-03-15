require 'rails_helper'

RSpec.describe 'api/v2/dashboard/analytics/edit', type: :view do
  before(:each) do
    @api / v2 / dashboard_analytic = assign(:api / v2 / dashboard_analytic, Api::V2::Dashboard::Analytic.create!)
  end

  it 'renders the edit api/v2/dashboard_analytic form' do
    render

    assert_select 'form[action=?][method=?]', api / v2 / dashboard_analytic_path(@api / v2 / dashboard_analytic), 'post' do
    end
  end
end
