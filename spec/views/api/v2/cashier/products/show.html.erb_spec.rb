require 'rails_helper'

RSpec.describe 'api/v2/cashier/products/show', type: :view do
  before(:each) do
    @api / v2 / cashier_product = assign(:api / v2 / cashier_product, Api::V2::Cashier::Product.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
