require 'rails_helper'

RSpec.describe 'api/v2/dashboard/brands/show', type: :view do
  before(:each) do
    @api / v2 / dashboard_brand = assign(:api / v2 / dashboard_brand, Api::V2::Dashboard::Brand.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
