require 'rails_helper'

RSpec.describe 'api/v2/dashboard/brands/edit', type: :view do
  before(:each) do
    @api / v2 / dashboard_brand = assign(:api / v2 / dashboard_brand, Api::V2::Dashboard::Brand.create!)
  end

  it 'renders the edit api/v2/dashboard_brand form' do
    render

    assert_select 'form[action=?][method=?]', api / v2 / dashboard_brand_path(@api / v2 / dashboard_brand), 'post' do
    end
  end
end
