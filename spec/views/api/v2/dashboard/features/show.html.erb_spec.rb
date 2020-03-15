require 'rails_helper'

RSpec.describe 'api/v2/dashboard/features/show', type: :view do
  before(:each) do
    @api / v2 / dashboard_feature = assign(:api / v2 / dashboard_feature, Api::V2::Dashboard::Feature.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
