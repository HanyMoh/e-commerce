require 'rails_helper'

RSpec.describe 'api/v2/dashboard/sub_products/show', type: :view do
  before(:each) do
    @api / v2 / dashboard_sub_product = assign(:api / v2 / dashboard_sub_product, Api::V2::Dashboard::SubProduct.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
