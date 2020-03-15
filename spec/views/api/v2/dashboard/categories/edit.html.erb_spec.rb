require 'rails_helper'

RSpec.describe 'api/v2/dashboard/categories/edit', type: :view do
  before(:each) do
    @api / v2 / dashboard_category = assign(:api / v2 / dashboard_category, Api::V2::Dashboard::Category.create!)
  end

  it 'renders the edit api/v2/dashboard_category form' do
    render

    assert_select 'form[action=?][method=?]', api / v2 / dashboard_category_path(@api / v2 / dashboard_category), 'post' do
    end
  end
end
