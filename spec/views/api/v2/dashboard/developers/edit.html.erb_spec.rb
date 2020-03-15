require 'rails_helper'

RSpec.describe 'api/v2/dashboard/developers/edit', type: :view do
  before(:each) do
    @api / v2 / dashboard_developer = assign(:api / v2 / dashboard_developer, Api::V2::Dashboard::Developer.create!)
  end

  it 'renders the edit api/v2/dashboard_developer form' do
    render

    assert_select 'form[action=?][method=?]', api / v2 / dashboard_developer_path(@api / v2 / dashboard_developer), 'post' do
    end
  end
end
