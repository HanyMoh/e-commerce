class Admin::SectionsController < Admin::BaseAdminController
  load_and_authorize_resource
  skip_before_action :verify_authenticity_token

  def new; end

  def create
    return unless @section.save
    if @section.shop360.web_json_data.nil?
      json_data = { 'type' => 'equirectangular',
                    'title' => @section.shop360.shop.name.to_s,
                    'panorama' => @section.image.resized.url.to_s }
      @shop360 = @section.shop360
      @shop360.web_json_data = json_data
      @shop360.save
    end
    flash[:notice] = 'Section has been created'
    redirect_to admin_shop360_sections_path(@section.shop360)
  end

  def edit; end

  def show; end

  def update
    return unless @section.update(section_params)
    if params[:section][:image]
      json_data = { 'type' => 'equirectangular',
                    'title' => @section.shop360.shop.name.to_s,
                    'panorama' => @section.image.resized.url.to_s }
      @shop360 = @section.shop360
      @shop360.web_json_data = json_data
      @shop360.save
    end
    flash[:notice] = 'Section has been updated'
    redirect_to admin_shop360_sections_path(@section.shop360)
  end

  def index
    @sections = Shop360.find(params[:shop360_id]).sections.order(id: :asc)
  end

  def destroy
    return unless @section.destroy
    flash[:notice] = 'Section was deleted'
    redirect_to admin_shop360_sections_path(@section.shop360)
  end

  private

  def section_params
    params.require(:section).permit(:title, :image, :shop360_id, :organization_id)
  end
end
