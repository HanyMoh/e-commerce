require 'rails_helper'

RSpec.describe 'api/v2/navbox/orders/edit', type: :view do
  before(:each) do
    @api / v2 / navbox_order = assign(:api / v2 / navbox_order, Api::V2::Navbox::Order.create!)
  end

  it 'renders the edit api/v2/navbox_order form' do
    render

    assert_select 'form[action=?][method=?]', api / v2 / navbox_order_path(@api / v2 / navbox_order), 'post' do
    end
  end
end
