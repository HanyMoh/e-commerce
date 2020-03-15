class Api::V2::Navbox::OrganizationsController < Api::V2::Navbox::ApiBaseController
  before_action :set_organization, except: %i[index]
  before_action :set_brands, only: :show
  before_action :set_themes, only: %i[organization_theme show]
  before_action :set_features, only: %i[features show]
  before_action :set_social_links, only: %i[social_links show]

  # GET /ipa/ver/sion/two/navbox/organizations.json
  def index
    @organizations = Organization.all
  end

  # GET /ipa/ver/sion/two/navbox/organizations/{id}.json
  def show; end

  # GET /ipa/ver/sion/two/navbox/organizations/{organization_id}/organization_theme
  def organization_theme; end

  # GET /ipa/ver/sion/two/navbox/organizations/{organization_id}/social_links
  def social_links; end

  # GET /ipa/ver/sion/two/navbox/organizations/{id}/features.json
  def features; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_organization
    @organization = if params[:name]
                      Organization.where('lower(organizations.name) like ?', params[:name].downcase).first
                    else
                      Organization.find(params[:id])
                    end
  end

  def set_brands
    @brands = @organization.brands
  end

  def set_themes
    @organization_theme = @organization.organization_theme
  end

  def set_features
    @features = @organization.feature
  end

  def set_social_links
    @social_links = @organization.social_link
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def organization_params
    params.require(:organization).permit(:name, :description, :type, feature: %i[cart campaign beacon panorama360])
  end
end
