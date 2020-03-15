require 'rails_helper'

RSpec.describe 'api/v2/dashboard/products/index', type: :view do
  before(:each) do
    assign(:api_v2_dashboard_products, [
             Api::V2::Dashboard::Product.create!,
             Api::V2::Dashboard::Product.create!
           ])
  end

  it 'renders a list of api/v2/dashboard/products' do
    render
  end
end
