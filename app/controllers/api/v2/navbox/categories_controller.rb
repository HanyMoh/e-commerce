class Api::V2::Navbox::CategoriesController < Api::V2::Navbox::ApiBaseController
  swagger_controller :categories, 'Navbox'

  swagger_api :index do
    summary 'Get all categories'
    notes <<-eos
      This APIs returns all categories existing on system<br/>
      Sending <b>organization_id</b> will return categories for this organization <br/>
      Sending <b>blank organization_id</b> will return all categories on the system</br>
      Parameter <b>page_number</b> will be usefull for pagination default: <b>32 per page</b><br/>
      Parameter <b>page_size</b> gives you control over the number of elements returnd in the request
    eos
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :query, :organization_id, :integer, :optional, 'Organization ID'
    param :query, :page, :integer, :required, 'Page Number'
    param :query, :page_size, :integer, :optional, 'Page Size'
    response :unauthorized
    response :not_found
  end

  # GET /ipa/ver/sion/two/navbox/categories.json
  def index
    @categories = if params[:organization_id]
                    set_categories
                    Category.where(id: @category_ids).newest_first
                  else
                    Category.roots.newest_first
                  end
    # @categories = @categories.limit(params[:page_size]) if params[:page_size]
  end

  # GET /ipa/ver/sion/two/navbox/categories/{id}/children.json
  def children
    @categories = Category.find(params[:category_id]).children.newest_first
  end

  swagger_api :show do
    summary 'Show a category by id'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :required, 'Category ID'
    param :form, :category_id, :integer, :required, 'Category ID'
    param :form, :name, :integer, :required, 'Category name'
    response :not_found
  end
  # GET /ipa/ver/sion/two/navbox/category/{id}?category_id={id}&name={category_name}.json
  def show
    @category = if params[:category_id]
                  Category.find(params[:category_id])
                else
                  Category.find_by(name: params[:name])
                end
  end

  private

  def set_categories
    products = Organization.find(params[:organization_id]).products
    @category_ids = products.pluck(:category_id).uniq
  end
end
