class Api::V2::Cashier::CategoriesController < Api::V2::Cashier::ApiBaseController
  swagger_api :index do
    summary 'Get all categories'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
  end
  # GET /api/v2/dashboard/categories
  # GET /api/v2/dashboard/categories.json
  def index
    @categories = Category.newest_first.per_page(params[:page])
  end
end
