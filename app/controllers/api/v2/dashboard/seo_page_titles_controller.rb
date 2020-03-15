class Api::V2::Dashboard::SeoPageTitlesController < Api::V2::Dashboard::ApiBaseController
  before_action :set_seo_page_title, only: %i[show edit update destroy]

  swagger_api :index do
    summary 'Get all seo_page_titles for admin or current manager'
    notes <<-eos
      Sending `admin token` as <b>X-User-Token</b> will return all seo_page_titles in the system.<br />
      Sending `manager token` as <b>X-User-Token</b> will return all seo_page_titles of current manager organization.<br />
    eos
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
  end
  # GET /api/v2/dashboard/seo_page_titles
  # GET /api/v2/dashboard/seo_page_titles.json
  def index
    @seo_page_titles = if current_manager
                         SeoPageTitle.where(organization_id: current_manager.organization_id).newest_first.per_page(param[:page])
                       else
                         SeoPageTitle.newest_first.per_page(param[:page])
                       end

    @seo_page_titles = @seo_page_titles.where(shop_id: params[:shop_id]) if params[:shop_id]
  end

  swagger_api :show do
    summary 'Show a SeoPageTitle by id'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :required, 'MetaTag ID'
    response :not_found
  end
  # GET /api/v2/dashboard/seo_page_titles/1
  # GET /api/v2/dashboard/seo_page_titles/1.json
  def show; end

  swagger_api :create do
    summary 'Create Seo Page Title'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :form, 'seo_page_title[name]', :string, :required, 'Name'
    param :form, 'seo_page_title[shop_id]', :string, :required, 'Shop ID'
    param :form, 'seo_page_title[organization_id]', :integer, :required, 'Organization ID'
  end
  # POST /api/v2/dashboard/seo_page_titles
  # POST /api/v2/dashboard/seo_page_titles.json
  def create
    @seo_page_title = SeoPageTitle.new(seo_page_title_params)
    render json: @seo_page_title.errors unless @seo_page_title.save
  end

  swagger_api :update do
    summary 'Update Seo Page Title'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Authentication Token'
    param :path, :id, :integer, :required, 'Seo Page Title ID'
    param :form, 'seo_page_title[name]', :string, :required, 'Name'
    param :form, 'seo_page_title[shop_id]', :string, :required, 'Shop ID'
    param :form, 'seo_page_title[organization_id]', :integer, :required, 'Organization ID'
  end
  # PATCH/PUT /api/v2/dashboard/seo_page_titles/1
  # PATCH/PUT /api/v2/dashboard/seo_page_titles/1.json
  def update
    render json: @seo_page_title.errors unless @seo_page_title.update(seo_page_title_params)
  end

  swagger_api :destroy do
    summary 'Deletes an existing Seo Page Title'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :optional, 'Seo Page Title Id'
    response :unauthorized
    response :not_found
  end
  # DELETE /api/v2/dashboard/seo_page_titles/1
  # DELETE /api/v2/dashboard/seo_page_titles/1.json
  def destroy
    @seo_page_title.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_seo_page_title
    @seo_page_title = if current_manager
                        SeoPageTitle.find_by!(id: params[:id], organization_id: current_manager.organization_id)
                      else
                        SeoPageTitle.find(params[:id])
                      end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def seo_page_title_params
    params.require(:seo_page_title).permit(:title, :shop_id, :organization_id)
  end
end
