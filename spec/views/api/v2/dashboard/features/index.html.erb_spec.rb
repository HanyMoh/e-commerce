require 'rails_helper'

RSpec.describe 'api/v2/dashboard/features/index', type: :view do
  before(:each) do
    assign(:api_v2_dashboard_features, [
             Api::V2::Dashboard::Feature.create!,
             Api::V2::Dashboard::Feature.create!
           ])
  end

  it 'renders a list of api/v2/dashboard/features' do
    render
  end
end
