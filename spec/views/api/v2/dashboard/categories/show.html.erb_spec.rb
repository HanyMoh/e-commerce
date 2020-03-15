require 'rails_helper'

RSpec.describe 'api/v2/dashboard/categories/show', type: :view do
  before(:each) do
    @api / v2 / dashboard_category = assign(:api / v2 / dashboard_category, Api::V2::Dashboard::Category.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
