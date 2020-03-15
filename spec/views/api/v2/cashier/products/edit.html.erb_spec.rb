require 'rails_helper'

RSpec.describe 'api/v2/cashier/products/edit', type: :view do
  before(:each) do
    @api / v2 / cashier_product = assign(:api / v2 / cashier_product, Api::V2::Cashier::Product.create!)
  end

  it 'renders the edit api/v2/cashier_product form' do
    render

    assert_select 'form[action=?][method=?]', api / v2 / cashier_product_path(@api / v2 / cashier_product), 'post' do
    end
  end
end
