require 'rails_helper'

RSpec.describe 'api/v2/dashboard/brands/new', type: :view do
  before(:each) do
    assign(:api / v2 / dashboard_brand, Api::V2::Dashboard::Brand.new)
  end

  it 'renders new api/v2/dashboard_brand form' do
    render

    assert_select 'form[action=?][method=?]', api_v2_dashboard_brands_path, 'post' do
    end
  end
end
