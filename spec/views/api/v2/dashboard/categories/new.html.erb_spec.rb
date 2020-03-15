require 'rails_helper'

RSpec.describe 'api/v2/dashboard/categories/new', type: :view do
  before(:each) do
    assign(:api / v2 / dashboard_category, Api::V2::Dashboard::Category.new)
  end

  it 'renders new api/v2/dashboard_category form' do
    render

    assert_select 'form[action=?][method=?]', api_v2_dashboard_categories_path, 'post' do
    end
  end
end
