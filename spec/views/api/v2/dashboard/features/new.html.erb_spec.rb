require 'rails_helper'

RSpec.describe 'api/v2/dashboard/features/new', type: :view do
  before(:each) do
    assign(:api / v2 / dashboard_feature, Api::V2::Dashboard::Feature.new)
  end

  it 'renders new api/v2/dashboard_feature form' do
    render

    assert_select 'form[action=?][method=?]', api_v2_dashboard_features_path, 'post' do
    end
  end
end
