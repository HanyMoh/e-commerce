class Api::V2::Dashboard::MetaTagsController < Api::V2::Dashboard::ApiBaseController
  before_action :set_meta_tag, only: %i[show edit update destroy]

  swagger_api :index do
    summary 'Get all meta_tags for admin or current manager'
    notes <<-eos
      Sending `admin token` as <b>X-User-Token</b> will return all meta_tags in the system.<br />
      Sending `manager token` as <b>X-User-Token</b> will return all meta_tags of current manager organization.<br />
    eos
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
  end
  # GET /api/v2/dashboard/meta_tags
  # GET /api/v2/dashboard/meta_tags.json
  def index
    @meta_tags = if current_manager
                   MetaTag.where(organization_id: current_manager.organization_id).newest_first
                 else
                   MetaTag.newest_first
                 end
    @meta_tags = @meta_tags.where(shop_id: params[:shop_id]) if params[:shop_id]
  end

  swagger_api :show do
    summary 'Show a MetaTag by id'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :required, 'MetaTag ID'
    response :not_found
  end
  # GET /api/v2/dashboard/meta_tags/1
  # GET /api/v2/dashboard/meta_tags/1.json
  def show; end

  swagger_api :create do
    summary 'Create Meta Tag'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :form, 'meta_tag[name]', :string, :required, 'Meta Tag name'
    param :form, 'meta_tag[content]', :string, :required, 'Meta Tag content'
    param :form, 'meta_tag[shop_id]', :integer, :required, 'Shop ID'
    param :form, 'meta_tag[organization_id]', :integer, :required, 'Organization ID'
  end
  # POST /api/v2/dashboard/meta_tags
  # POST /api/v2/dashboard/meta_tags.json
  def create
    @meta_tag = MetaTag.new(meta_tag_params)
    render json: @meta_tag.errors unless @meta_tag.save
  end

  swagger_api :update do
    summary 'Update Meta Tag'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Authentication Token'
    param :path, :id, :integer, :required, 'Meta Tag ID'
    param :form, 'meta_tag[name]', :string, :required, 'Meta Tag name'
    param :form, 'meta_tag[content]', :string, :required, 'Meta Tag content'
    param :form, 'meta_tag[shop_id]', :integer, :required, 'Shop ID'
    param :form, 'meta_tag[organization_id]', :integer, :required, 'Organization ID'
  end
  # PATCH/PUT /api/v2/dashboard/meta_tags/1
  # PATCH/PUT /api/v2/dashboard/meta_tags/1.json
  def update
    render json: @meta_tag.errors unless @meta_tag.update(meta_tag_params)
  end

  swagger_api :destroy do
    summary 'Deletes an existing MetaTag'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :optional, 'MetaTag Id'
    response :unauthorized
    response :not_found
  end
  # DELETE /api/v2/dashboard/meta_tags/1
  # DELETE /api/v2/dashboard/meta_tags/1.json
  def destroy
    @meta_tag.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_meta_tag
    @meta_tag = if current_manager
                  MetaTag.find_by!(id: params[:id], organization_id: current_manager.organization_id)
                else
                  MetaTag.find(params[:id])
                end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def meta_tag_params
    params.require(:meta_tag).permit(:name, :content, :shop_id, :organization_id)
  end
end
