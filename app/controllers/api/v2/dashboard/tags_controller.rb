class Api::V2::Dashboard::TagsController < Api::V2::Dashboard::ApiBaseController
  before_action :set_tag, only: %i[show edit update destroy]

  # GET /api/v2/dashboard/tags
  # GET /api/v2/dashboard/tags.json
  def index
    @tags = if current_manager
              Tag.where(organization_id: current_manager.organization_id).newest_first.per_page(:page)
            else
              Tag.newest_first.per_page(:page)
            end
  end

  # GET /api/v2/dashboard/tags/1
  # GET /api/v2/dashboard/tags/1.json
  def show; end

  # POST /api/v2/dashboard/tags
  # POST /api/v2/dashboard/tags.json
  def create
    @tag = Tag.new(tag_params)
    render json: @tag.errors unless @tag.save
  end

  # PATCH/PUT /api/v2/dashboard/tags/1
  # PATCH/PUT /api/v2/dashboard/tags/1.json
  def update
    render json: @tag.errors unless @tag.update(tag_params)
  end

  # DELETE /api/v2/dashboard/tags/1
  # DELETE /api/v2/dashboard/tags/1.json
  def destroy
    @tag.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tag
    @tag = if current_manager
             Tag.find_by!(id: params[:id], organization_id: current_manager.organization_id)
           else
             Tag.find(params[:id])
           end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tag_params
    params.require(:tag).permit(:name, :organization_id)
  end
end
