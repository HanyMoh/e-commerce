require 'rails_helper'

RSpec.describe Admin::BrandsController, type: :controller do
  include Devise::Test::ControllerHelpers

  before(:each) do
    @brand = create(:brand)
    @request.env['devise.mapping'] = Devise.mappings[:admin]
    sign_in create(:admin), scope: :admin
  end

  describe 'GET #index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end
    it 'assigns @brands' do
      get :index
      expect(assigns(:brands)).to eq([@brand])
    end
    it 'render an index template' do
      get :index
      should render_template(:index)
    end
    it { should route(:get, 'admin/brands').to(action: :index) }
  end

  describe 'GET #show' do
    it 'assigns the requested brand to @brand' do
      get :show, params: { id: @brand }
      assigns(:brand).should eq(@brand)
    end

    it 'renders the #show view' do
      get :show, params: { id: @brand }
      should render_template :show
    end
  end
end
