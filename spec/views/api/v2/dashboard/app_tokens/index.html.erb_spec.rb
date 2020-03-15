require 'rails_helper'

RSpec.describe 'api/v2/dashboard/app_tokens/index', type: :view do
  before(:each) do
    assign(:api_v2_dashboard_app_tokens, [
             Api::V2::Dashboard::AppToken.create!,
             Api::V2::Dashboard::AppToken.create!
           ])
  end

  it 'renders a list of api/v2/dashboard/app_tokens' do
    render
  end
end
