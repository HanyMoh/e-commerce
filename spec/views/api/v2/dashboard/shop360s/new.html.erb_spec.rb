require 'rails_helper'

RSpec.describe 'api/v2/dashboard/shop360s/new', type: :view do
  before(:each) do
    assign(:api / v2 / dashboard_shop360, Api::V2::Dashboard::Shop360.new)
  end

  it 'renders new api/v2/dashboard_shop360 form' do
    render

    assert_select 'form[action=?][method=?]', api_v2_dashboard_shop360s_path, 'post' do
    end
  end
end
