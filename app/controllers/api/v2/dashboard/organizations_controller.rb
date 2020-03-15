class Api::V2::Dashboard::OrganizationsController < Api::V2::Dashboard::ApiBaseController
  include Response
  before_action :set_organization, only: %i[show update destroy]
  before_action :set_feature, only: :update
  before_action :set_organization_theme, only: :update
  before_action :set_social_link, only: :update

  swagger_controller :organizations, 'Dashboard'

  swagger_api :index do
    summary 'Get all organizations for admin or current manager'
    notes <<-eos
      Sending `admin token` as <b>X-User-Token</b> will return all organizations in the system.<br />
      Sending `manager token` as <b>X-User-Token</b> will return current manager organization.<br />
    eos
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
  end
  # GET /api/v2/dashboard/organizations
  # GET /api/v2/dashboard/organizations.json
  def index
    @organizations = if current_manager
                       Organization.find(current_manager.organization_id)
                     else
                       Organization.newest_first.per_page(params[:page])
                     end
  end

  swagger_api :show do
    summary 'Show a organization by id'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :required, 'Oragnization ID'
    response :not_found
  end
  # GET /api/v2/dashboard/organizations/1
  # GET /api/v2/dashboard/organizations/1.json
  def show; end

  swagger_api :update do
    summary 'Update organization'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Authentication Token'
    param :path, :id, :integer, :required, 'Organization ID'
    param :form, 'organization[name]', :string, :required, 'Organization Name'
    param :form, 'organization[description]', :string, :required, 'Organization Description'
    param :form, 'organization[type]', :string, :required, 'Organization Type'
    param :form, 'organization[feature_attributes][][id]', :integer, :required, 'Organization Feature ID'
    param :form, 'organization[feature_attributes][][cart]', :boolean, :required, 'Organization Feature[Cart]'
    param :form, 'organization[feature_attributes][][campaign]', :boolean, :required, 'Organization Feature[Campaign]'
    param :form, 'organization[feature_attributes][][beacon]', :boolean, :required, 'Organization Feature[Beacon]'
    param :form, 'organization[feature_attributes][][panorama360]', :boolean, :required, 'Organization Feature[panorama360]'
    param :form, 'organization[social_link_attributes][][id]', :integer, :required, 'Social Link ID'
    param :form, 'organization[social_link_attributes][][facebook]', :string, :required, 'Facebook'
    param :form, 'organization[social_link_attributes][][twitter]', :string, :required, 'Twitter'
    param :form, 'organization[social_link_attributes][][instagram]', :string, :required, 'Instagram'
    param :form, 'organization[organization_theme_attributes][][id]', :integer, :required, 'Organization Theme ID'
    param :form, 'organization[organization_theme_attributes][][first_color]', :string, :required, 'First Color'
    param :form, 'organization[organization_theme_attributes][second_color]', :string, :required, 'Second Color'
    param :form, 'organization[organization_theme_attributes][][first_section]', :boolean, :required, 'First section'
    param :form, 'organization[organization_theme_attributes][][first_section_product]', :integer, :required, 'First Section Product'
    param :form, 'organization[organization_theme_attributes][][first_section_image]', :string, :required, 'First section Image'
    param :form, 'organization[organization_theme_attributes][][logo]', :string, :required, 'Logo'
    param :form, 'organization[organization_theme_attributes][][second_section]', :boolean, :required, 'Second Section'
    param :form, 'organization[organization_theme_attributes][][second_section_product]', :integer, :required, 'Second Section Product'
    param :form, 'organization[organization_theme_attributes][][second_section_image]', :string, :required, 'Second Section Image'
    param :form, 'organization[organization_theme_attributes][][slider_body]', :boolean, :required, 'Slider body'
    param :form, 'organization[organization_theme_attributes][][slider_header]', :string, :required, 'Slider header'
    param :form, 'organization[organization_theme_attributes][][slider_images]', :string, :required, 'Slider images'
  end
  # PATCH/PUT /api/v2/dashboard/organizations/1
  # PATCH/PUT /api/v2/dashboard/organizations/1.json
  def update
    @organization.social_link = @social_link
    @organization.feature = @feature
    @organization.organization_theme = @organization_theme
    render json: @organization.errors unless @organization.update(filtered_org_params)
  end

  swagger_api :destroy do
    summary 'Deletes an existing Organization'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :optional, 'Organization Id'
    response :unauthorized
    response :not_found
  end
  # DELETE /api/v2/dashboard/organizations/1
  # DELETE /api/v2/dashboard/organizations/1.json
  def destroy
    @organization.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_organization
    @organization = if current_manager
                      current_manager.organization
                    else
                      Organization.find(params[:id])
                    end
  end

  def set_feature
    @feature = if @organization.feature
                 @organization.feature.update!(organization_params[:feature_attributes])
                 @organization.feature
               else
                 Feature.new(organization_params[:feature_attributes])
               end
  end

  def set_organization_theme
    @organization_theme = if @organization.organization_theme
                            @organization.organization_theme.update!(organization_params[:organization_theme_attributes])
                            @organization.organization_theme
                          else
                            OrganizationTheme.new(organization_params[:organization_theme_attributes])
                          end
  end

  def set_social_link
    @social_link = if @organization.social_link
                     @organization.social_link.update!(organization_params[:social_link_attributes])
                     @organization.social_link
                   else
                     SocialLink.new(organization_params[:social_link_attributes])
                   end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def organization_params
    params.require(:organization).permit(:name, :description, :type, feature_attributes: %i[id cart campaign beacon panorama360], social_link_attributes: %i[id facebook twitter instagram], organization_theme_attributes: %i[id first_color second_color first_section first_section_product first_section_image logo second_section second_section_product second_section_image slider_body slider_header slider_images])
  end

  def filtered_org_params
    organization_params.except(:feature_attributes, :social_link_attributes, :organization_theme_attributes)
  end
end
