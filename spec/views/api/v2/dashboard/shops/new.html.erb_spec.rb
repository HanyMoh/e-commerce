require 'rails_helper'

RSpec.describe 'api/v2/dashboard/shops/new', type: :view do
  before(:each) do
    assign(:api / v2 / dashboard_shop, Api::V2::Dashboard::Shop.new)
  end

  it 'renders new api/v2/dashboard_shop form' do
    render

    assert_select 'form[action=?][method=?]', api_v2_dashboard_shops_path, 'post' do
    end
  end
end
