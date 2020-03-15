require 'rails_helper'

RSpec.describe 'api/v2/navbox/orders/show', type: :view do
  before(:each) do
    @api / v2 / navbox_order = assign(:api / v2 / navbox_order, Api::V2::Navbox::Order.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
