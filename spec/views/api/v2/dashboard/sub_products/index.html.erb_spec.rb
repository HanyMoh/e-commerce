require 'rails_helper'

RSpec.describe 'api/v2/dashboard/sub_products/index', type: :view do
  before(:each) do
    assign(:api_v2_dashboard_sub_products, [
             Api::V2::Dashboard::SubProduct.create!,
             Api::V2::Dashboard::SubProduct.create!
           ])
  end

  it 'renders a list of api/v2/dashboard/sub_products' do
    render
  end
end
