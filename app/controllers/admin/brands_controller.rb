class Admin::BrandsController < Admin::BaseAdminController
  load_and_authorize_resource
  skip_load_resource only: :index
  before_action :set_brand, only: %i[brand_shops brand_sub_categories]
  before_action :set_categories, only: %i[new edit intro_form]
  before_action :check_current_user, only: %i[new edit intro_form]

  def new; end

  def create
    if @brand.save
      cookies['popup'] = 'show'
      if current_organization_manager.brands.count == 1
        respond_with(@brand, location: admin_dashboard_path)
      else
        respond_with(@brand, location: admin_brand_path(@brand))
      end
    else
      current_organization_manager.brands.count.zero? ? (render 'intro_form') : (render 'new')
    end
  end

  def edit; end

  def update
    if @brand.update(brand_params)
      respond_with(@brand, location: admin_brand_path(@brand)) if @brand.save
    else
      render 'edit'
    end
  end

  def index
    @brands = if current_organization_manager
                current_organization_manager.brands
              elsif current_admin
                Brand.all
              end
  end

  def intro_form
    @brand = Brand.new
    render layout: 'brand_intro'
  end

  def show
    @status = cookies['popup']
    cookies.delete :popup
  end

  def destroy
    return unless @brand.destroy
    respond_with(@brand, location: admin_brands_path)
  end

  def brand_shops
    @shops = @brand.shops.accessible_by(current_ability)
    respond_with(@shops)
  end

  def brand_sub_categories
    @sub_categories = @brand.category.children
    respond_with(@sub_categories)
  end

  private

  def brand_params
    params.require(:brand).permit(:name, :display_name, :following_standards, :category_id,
                                  :organization_id, :logo, :dark_logo, :description,
                                  :pinterest, :youtube, :snapchat, :google_plus, :organization_manager_id,
                                  :facebook, :twitter, :instagram, :banner_image,
                                  :sat, :sun, :mon, :tue, :wed, :thu, :fri, :from, :to,
                                  categories: [], manager_ids: [], employee_user_ids: [],
                                  websites: [], phone_numbers: [])
  end

  def set_brand
    @brand = Brand.find(params[:id])
  end

  def check_current_user
    redirect_to admin_brands_path if current_admin
  end

  def set_categories
    @categories = Category.roots
  end
end
