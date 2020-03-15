require 'rails_helper'

RSpec.describe 'api/v2/dashboard/analytics/show', type: :view do
  before(:each) do
    @api / v2 / dashboard_analytic = assign(:api / v2 / dashboard_analytic, Api::V2::Dashboard::Analytic.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
