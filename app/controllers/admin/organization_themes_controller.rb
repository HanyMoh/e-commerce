class Admin::OrganizationThemesController < Admin::BaseAdminController
  load_and_authorize_resource
  before_action :set_brands, only: :index
  before_action :set_brand, only: %i[new edit]

  def new; end

  def create
    if @organization_theme.save
      flash[:notice] = 'Theme has been updated'
      redirect_to admin_organization_themes_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @organization_theme.update(organization_theme_params)
      flash[:notice] = 'Theme has been updated'
      redirect_to admin_organization_themes_path
    else
      render 'edit'
    end
  end

  def index; end

  def destroy
    return unless @organization_theme.destroy
    flash[:notice] = 'Theme was deleted'
    redirect_to admin_organization_themes_path
  end

  private

  def organization_theme_params
    params.require(:organization_theme).permit(:first_color, :second_color, :logo, :organization_id,
                                               :first_section, :first_section_product, :first_section_image,
                                               :second_section, :second_section_product, :second_section_image,
                                               :slider_body, :slider_header, slider_images: [])
  end

  def set_brands
    @brands = current_manager.brands
  end

  def set_brand
    @brand = Brand.find(params[:brand])
  end
end
