require 'rails_helper'

RSpec.describe 'api/v2/dashboard/products/show', type: :view do
  before(:each) do
    @api / v2 / dashboard_product = assign(:api / v2 / dashboard_product, Api::V2::Dashboard::Product.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
