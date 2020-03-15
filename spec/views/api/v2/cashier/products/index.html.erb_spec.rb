require 'rails_helper'

RSpec.describe 'api/v2/cashier/products/index', type: :view do
  before(:each) do
    assign(:api_v2_cashier_products, [
             Api::V2::Cashier::Product.create!,
             Api::V2::Cashier::Product.create!
           ])
  end

  it 'renders a list of api/v2/cashier/products' do
    render
  end
end
