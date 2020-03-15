class Api::V2::Dashboard::CategoriesController < Api::V2::Dashboard::ApiBaseController
  before_action :set_category, only: %i[show edit update destroy]
  before_action :set_categories, only: :index

  swagger_api :index do
    summary 'Get all categories for admin or current manager'
    notes <<-eos
      Sending `admin token` as <b>X-User-Token</b> will return all categories in the system.<br />
      Sending `manager token` as <b>X-User-Token</b> will return all categories of current manager organization.<br />
    eos
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
  end
  # GET /api/v2/dashboard/categories
  # GET /api/v2/dashboard/categories.json
  def index
    @categories = if current_manager
                    Category.where(id: @category_ids).newest_first.per_page(params[:page])
                  else
                    Category.roots.newest_first.per_page(params[:page])
                  end
  end

  swagger_api :show do
    summary 'Show a category by id'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :required, 'Building ID'
    response :not_found
  end
  # GET /api/v2/dashboard/categories/1
  # GET /api/v2/dashboard/categories/1.json
  def show; end

  swagger_api :create do
    summary 'Create Category'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :form, 'category[name]', :string, :required, 'category name'
    param :form, 'category[parent_id]', :string, :required, 'category parent ID'
    param :form, 'category[logo]', :string, :required, 'category logo'
    param :form, 'category[sub_categories_attributes][][name]', :string, :required, 'sub category name'
    param :form, 'category[sub_categories_attributes][][logo]', :string, :required, 'sub category logo'
  end
  # POST /api/v2/dashboard/categories
  # POST /api/v2/dashboard/categories.json
  def create
    @category = Category.new(category_params)
    if @category.save
      @category.sub_categories.build
    else
      render json: @category.errors
    end
  end

  swagger_api :update do
    summary 'Update category'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Authentication Token'
    param :path, :id, :integer, :required, 'Category ID'
    param :form, 'category[name]', :string, :required, 'category name'
    param :form, 'category[parent_id]', :string, :required, 'category parent ID'
    param :form, 'category[logo]', :string, :required, 'category logo'
    param :form, 'category[sub_categories_attributes][][id]', :string, :required, 'sub category name'
    param :form, 'category[sub_categories_attributes][][name]', :string, :required, 'sub category name'
    param :form, 'category[sub_categories_attributes][][logo]', :string, :required, 'sub category logo'
  end
  # PATCH/PUT /api/v2/dashboard/categories/1
  # PATCH/PUT /api/v2/dashboard/categories/1.json
  def update
    render json: @category.errors unless @category.update(category_params)
  end

  swagger_api :destroy do
    summary 'Deletes an existing Category'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :optional, 'Category Id'
    response :unauthorized
    response :not_found
  end
  # DELETE /api/v2/dashboard/categories/1
  # DELETE /api/v2/dashboard/categories/1.json
  def destroy
    @category.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = if current_manager
                  Category.find_by!(id: params[:id])
                else
                  Category.find(params[:id])
                end
  end

  def set_categories
    products = Organization.find(current_manager.organization_id).products
    @category_ids = products.pluck(:category_id).uniq
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def category_params
    params.require(:category).permit(:name, :parent_id, :logo,
                                     sub_categories_attributes: %i[id name logo _destroy])
  end
end
