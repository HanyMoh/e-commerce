class Api::V2::Mobile::ProductsController < Api::V2::Mobile::ApiBaseController
  acts_as_token_authentication_handler_for User, fallback_to_devise: :true,
                                                 only: :destroy

  swagger_controller :products, 'Mobile'

  swagger_api :products_locations do
    summary 'Get all categories'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :query, :search, :string, :required, 'Search Query'
    response :unauthorized
    response :not_found
  end

  def products_locations
    @products = Product.where('lower(name) like ?', "%#{params[:search]}%")
  end
end
