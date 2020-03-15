class Admin::SeoPageTitlesController < Admin::BaseAdminController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  load_and_authorize_resource
  skip_load_resource only: :index
  before_action :set_shops, only: %i[new edit index]

  def new
    unless @shops.include?(Shop.where(id: params[:shop]).first)
      flash[:error] = 'You\'re not allowed to perform this action'
      redirect_to admin_seo_page_titles_path
    end
  end

  def create
    if @seo_page_title.save(seo_page_title_params)
      flash[:notice] = 'Title has been set'
      redirect_to admin_seo_page_titles_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @seo_page_title.update(seo_page_title_params)
      flash[:notice] = 'Title has been updated'
      redirect_to admin_seo_page_titles_path
    else
      render 'edit'
    end
  end

  def index
    @shops = []
    manager_or_employee_brands.each do |brand|
      brand.shops.each do |shop|
        @shops << shop
      end
    end
  end

  def destroy
    if @seo_page_title.destroy
      flash[:notice] = "You're now using the default page title"
      redirect_to admin_seo_page_titles_path
    end
  end

  private

  def seo_page_title_params
    params.require(:seo_page_title).permit(:title, :shop_id)
  end

  def set_shops
    @shops = []
    manager_or_employee_brands.each do |brand|
      brand.shops.each do |shop|
        @shops << shop
      end
    end
  end
end
