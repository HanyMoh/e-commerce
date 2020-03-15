require 'rails_helper'

RSpec.describe 'api/v2/dashboard/app_tokens/new', type: :view do
  before(:each) do
    assign(:api / v2 / dashboard_app_token, Api::V2::Dashboard::AppToken.new)
  end

  it 'renders new api/v2/dashboard_app_token form' do
    render

    assert_select 'form[action=?][method=?]', api_v2_dashboard_app_tokens_path, 'post' do
    end
  end
end
