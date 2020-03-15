require 'rails_helper'

RSpec.describe 'api/v2/dashboard/shops/edit', type: :view do
  before(:each) do
    @api / v2 / dashboard_shop = assign(:api / v2 / dashboard_shop, Api::V2::Dashboard::Shop.create!)
  end

  it 'renders the edit api/v2/dashboard_shop form' do
    render

    assert_select 'form[action=?][method=?]', api / v2 / dashboard_shop_path(@api / v2 / dashboard_shop), 'post' do
    end
  end
end
