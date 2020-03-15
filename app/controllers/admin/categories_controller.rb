class Admin::CategoriesController < Admin::BaseAdminController
  load_and_authorize_resource

  def new
    @category.sub_categories.build
  end

  def index
    @categories = @categories.roots.order(name: 'asc').per_page(params[:page])
  end

  def show; end

  def edit; end

  def create
    if @category.save
      respond_with(@category, location: admin_categories_path)
    else
      render 'new'
    end
  end

  def update
    if @category.update(category_params)
      respond_with(@category, location: admin_categories_path)
    else
      render 'edit'
    end
  end

  def destroy
    respond_with(@category, location: admin_categories_path) if @category.delete
  end

  private

  def category_params
    params.require(:category).permit(:name, :parent_id, :logo,
                                     sub_categories_attributes: %i[id name logo _destroy])
  end
end
