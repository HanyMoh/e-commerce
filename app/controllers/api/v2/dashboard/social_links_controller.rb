class Api::V2::Dashboard::SocialLinksController < Api::V2::Dashboard::ApiBaseController
  before_action :set_social_link, only: %i[show edit update destroy]

  # GET /api/v2/dashboard/social_links
  # GET /api/v2/dashboard/social_links.json
  def index
    @social_links = if current_manager
                      current_manager.organization.social_link
                    else
                      SocialLink.newest_first.per_page(:page)
                    end
  end

  # GET /api/v2/dashboard/social_links/1
  # GET /api/v2/dashboard/social_links/1.json
  def show; end

  # POST /api/v2/dashboard/social_links
  # POST /api/v2/dashboard/social_links.json
  def create
    @social_link = SocialLink.new(social_link_params)
    render json: @social_link.errors unless @social_link.save
  end

  # PATCH/PUT /api/v2/dashboard/social_links/1
  # PATCH/PUT /api/v2/dashboard/social_links/1.json
  def update
    render json: @social_link.errors unless @social_link.update(social_link_params)
  end

  # DELETE /api/v2/dashboard/social_links/1
  # DELETE /api/v2/dashboard/social_links/1.json
  def destroy
    @social_link.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_social_link
    @social_link = if current_manager
                     SocialLink.find_by!(id: params[:id], organization_id: current_manager.organization_id)
                   else
                     SocialLink.find(params[:id])
                   end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def social_link_params
    params.require(:social_link).permit(:facebook, :twitter, :instagram, :organization_id)
  end
end
