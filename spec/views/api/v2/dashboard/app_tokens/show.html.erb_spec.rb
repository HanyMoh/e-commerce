require 'rails_helper'

RSpec.describe 'api/v2/dashboard/app_tokens/show', type: :view do
  before(:each) do
    @api / v2 / dashboard_app_token = assign(:api / v2 / dashboard_app_token, Api::V2::Dashboard::AppToken.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
