require 'rails_helper'

RSpec.describe 'api/v2/dashboard/categories/index', type: :view do
  before(:each) do
    assign(:api_v2_dashboard_categories, [
             Api::V2::Dashboard::Category.create!,
             Api::V2::Dashboard::Category.create!
           ])
  end

  it 'renders a list of api/v2/dashboard/categories' do
    render
  end
end
