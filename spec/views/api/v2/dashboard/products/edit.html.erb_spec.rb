require 'rails_helper'

RSpec.describe 'api/v2/dashboard/products/edit', type: :view do
  before(:each) do
    @api / v2 / dashboard_product = assign(:api / v2 / dashboard_product, Api::V2::Dashboard::Product.create!)
  end

  it 'renders the edit api/v2/dashboard_product form' do
    render

    assert_select 'form[action=?][method=?]', api / v2 / dashboard_product_path(@api / v2 / dashboard_product), 'post' do
    end
  end
end
