require 'rails_helper'

RSpec.describe 'api/v2/dashboard/shops/show', type: :view do
  before(:each) do
    @api / v2 / dashboard_shop = assign(:api / v2 / dashboard_shop, Api::V2::Dashboard::Shop.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
