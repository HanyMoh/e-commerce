class Admin::MetaTagsController < Admin::BaseAdminController
  load_and_authorize_resource
  before_action :set_brands, only: :new

  def new; end

  def create
    params[:shops]&.map do |shop|
      MetaTag.create(name: params[:meta_tag][:name], content: params[:meta_tag][:content],
                     shop_id: shop, organization_id: current_active_user.organization_id)
    end
    flash[:notice] = 'Meta Tag has been added'
    redirect_to admin_meta_tags_path
  end

  def edit; end

  def update
    return unless @meta_tag.update(meta_tag_params)
    flash[:notice] = 'Meta Tag has been updated'
    redirect_to admin_meta_tags_path
  end

  def index
    @general_meta_tags = MetaTag.where(shop_id: nil, product_id: nil) if current_admin
    shops = []
    manager_or_employee_brands.each do |brand|
      brand.shops.each do |shop|
        shops << shop
      end
    end
    @shops_meta_tags = MetaTag.where(product_id: nil).where(shop: shops).order(:id)
  end

  def destroy
    return unless @meta_tag.destroy
    flash[:notice] = 'Meta Tag has been deleted'
    redirect_to admin_meta_tags_path
  end

  private

  def meta_tag_params
    params.require(:meta_tag).permit(:name, :content, :shop_id, :organization_id)
  end

  def set_brands
    @brands = manager_or_employee_brands
  end
end
