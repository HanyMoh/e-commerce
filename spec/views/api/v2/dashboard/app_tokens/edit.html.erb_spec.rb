require 'rails_helper'

RSpec.describe 'api/v2/dashboard/app_tokens/edit', type: :view do
  before(:each) do
    @api / v2 / dashboard_app_token = assign(:api / v2 / dashboard_app_token, Api::V2::Dashboard::AppToken.create!)
  end

  it 'renders the edit api/v2/dashboard_app_token form' do
    render

    assert_select 'form[action=?][method=?]', api / v2 / dashboard_app_token_path(@api / v2 / dashboard_app_token), 'post' do
    end
  end
end
