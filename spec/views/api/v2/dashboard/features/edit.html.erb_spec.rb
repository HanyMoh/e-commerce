require 'rails_helper'

RSpec.describe 'api/v2/dashboard/features/edit', type: :view do
  before(:each) do
    @api / v2 / dashboard_feature = assign(:api / v2 / dashboard_feature, Api::V2::Dashboard::Feature.create!)
  end

  it 'renders the edit api/v2/dashboard_feature form' do
    render

    assert_select 'form[action=?][method=?]', api / v2 / dashboard_feature_path(@api / v2 / dashboard_feature), 'post' do
    end
  end
end
