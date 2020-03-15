class Api::V2::Dashboard::OrganizationThemesController < Api::V2::Dashboard::ApiBaseController
  before_action :set_organization_theme, only: %i[show edit update destroy]

  swagger_api :index do
    summary 'Get all organization_themes for admin or current manager'
    notes <<-eos
      Sending `admin token` as <b>X-User-Token</b> will return all organization_themes in the system.<br />
      Sending `manager token` as <b>X-User-Token</b> will return organization_theme of current manager organization.<br />
    eos
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
  end
  # GET /api/v2/dashboard/organization_themes
  # GET /api/v2/dashboard/organization_themes.json
  def index
    @organization_themes = if current_manager
                             current_manager.organization.organization_theme
                           else
                             OrganizationTheme.newest_first.per_page(params[:page])
                           end
  end

  swagger_api :show do
    summary 'Show a Organization Theme by id'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :required, 'Organization Theme ID'
    response :not_found
  end
  # GET /api/v2/dashboard/organization_themes/1
  # GET /api/v2/dashboard/organization_themes/1.json
  def show; end

  swagger_api :create do
    summary 'Create Organization Theme'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :form, 'organization_theme[first_color]', :string, :required, 'Meta Tag name'
    param :form, 'organization_theme[second_color]', :string, :required, 'Meta Tag name'
    param :form, 'organization_theme[logo]', :string, :required, 'Meta Tag name'
    param :form, 'organization_theme[organization_id]', :integer, :required, 'Meta Tag name'
    param :form, 'organization_theme[first_section]', :boolean, :required, 'Meta Tag name'
    param :form, 'organization_theme[first_section_product]', :string, :required, 'Meta Tag name'
    param :form, 'organization_theme[first_section_image]', :string, :required, 'Meta Tag name'
    param :form, 'organization_theme[second_section]', :boolean, :required, 'Meta Tag name'
    param :form, 'organization_theme[second_section_product]', :string, :required, 'Meta Tag name'
    param :form, 'organization_theme[second_section_image]', :string, :required, 'Meta Tag name'
    param :form, 'organization_theme[slider_body]', :boolean, :required, 'Meta Tag name'
    param :form, 'organization_theme[slider_header]', :string, :required, 'Meta Tag name'
    param :form, 'organization_theme[slider_images]', :string, :required, 'Meta Tag name'
  end
  # POST /api/v2/dashboard/organization_themes
  # POST /api/v2/dashboard/organization_themes.json
  def create
    @organization_theme = OrganizationTheme.new(organization_theme_params)
    render json: @organization_theme.errors unless @organization_theme.save
  end

  swagger_api :update do
    summary 'Update Organization Theme'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Authentication Token'
    param :path, :id, :integer, :required, 'Organization Theme ID'
  end
  # PATCH/PUT /api/v2/dashboard/organization_themes/1
  # PATCH/PUT /api/v2/dashboard/organization_themes/1.json
  def update
    unless @organization_theme.update(organization_theme_params)
      render json: @organization_theme.errors
    end
  end

  swagger_api :destroy do
    summary 'Deletes an existing Organization Theme'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :optional, 'Oragnization Id'
    response :unauthorized
    response :not_found
  end
  # DELETE /api/v2/dashboard/organization_themes/1
  # DELETE /api/v2/dashboard/organization_themes/1.json
  def destroy
    @organization_theme.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_organization_theme
    @organization_theme = if current_manager
                            current_manager.organization.organization_theme
                          else
                            OrganizationTheme.find(params[:id])
                          end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def organization_theme_params
    params.require(:organization_theme).permit(:first_color, :second_color, :logo, :organization_id,
                                               :first_section, :first_section_product, :first_section_image,
                                               :second_section, :second_section_product, :second_section_image,
                                               :slider_body, :slider_header, slider_images: [])
  end
end
