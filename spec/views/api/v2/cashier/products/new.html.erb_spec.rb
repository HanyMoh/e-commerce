require 'rails_helper'

RSpec.describe 'api/v2/cashier/products/new', type: :view do
  before(:each) do
    assign(:api / v2 / cashier_product, Api::V2::Cashier::Product.new)
  end

  it 'renders new api/v2/cashier_product form' do
    render

    assert_select 'form[action=?][method=?]', api_v2_cashier_products_path, 'post' do
    end
  end
end
