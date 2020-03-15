class Api::V2::Dashboard::BrandsController < Api::V2::Dashboard::ApiBaseController
  before_action :set_brand, only: %i[show edit update destroy]

  swagger_controller :brands, 'Dashboard'

  swagger_api :index do
    summary 'Get all brands for admin or current manager'
    notes <<-eos
      Sending `admin token` as <b>X-User-Token</b> will return all brands in the system.<br />
      Sending `manager token` as <b>X-User-Token</b> will return all brands of current manager organization.<br />
    eos
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
  end
  # GET /api/v2/dashboard/brands
  # GET /api/v2/dashboard/brands.json
  def index
    @brands = if current_manager
                Organization.find(current_manager.organization_id).brands.per_page(params[:page])
              else
                Brand.newest_first.per_page(params[:page])
              end
  end

  swagger_api :show do
    summary 'Show a brand by id'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :required, 'Brand ID'
    response :not_found
  end
  # GET /api/v2/dashboard/brands/1
  # GET /api/v2/dashboard/brands/1.json
  def show; end

  swagger_api :create do
    summary 'Create Brand'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :form, 'brand[name]', :string, :required, 'Brand Name'
    param :form, 'brand[display_name]', :string, :required, 'Brand display Name'
    param :form, 'brand[following_standards]', :boolean, :required, 'Following Standards'
    param :form, 'brand[category_id]', :integer, :required, 'Category ID'
    param :form, 'brand[organization_id]', :integer, :required, 'Organization ID'
    param :form, 'brand[organization_manager_id]', :integer, :required, 'Organization Manager ID'
    param :form, 'brand[logo]', :string, :required, 'Brand Logo'
    param :form, 'brand[dark_logo]', :string, :required, 'Brand dark logo'
    param :form, 'brand[description]', :string, :required, 'Brand description'
    param :form, 'brand[youtube]', :string, :required, 'Youtube Link'
    param :form, 'brand[instagram]', :string, :required, 'Instagram Link'
    param :form, 'brand[facebook]', :string, :required, 'Facebook Link'
    param :form, 'brand[twitter]', :string, :required, 'Twitter Link'
    param :form, 'brand[banner_image]', :string, :required, 'Brand banner image'
    param :form, 'brand[sat]', :boolean, :required, 'sat'
    param :form, 'brand[sun]', :boolean, :required, 'sun'
    param :form, 'brand[mon]', :boolean, :required, 'mon'
    param :form, 'brand[tue]', :boolean, :required, 'tue'
    param :form, 'brand[wed]', :boolean, :required, 'wed'
    param :form, 'brand[thu]', :boolean, :required, 'thu'
    param :form, 'brand[fri]', :boolean, :required, 'fri'
    param :form, 'brand[from]', :string, :required, 'from'
    param :form, 'brand[to]', :string, :required, 'to'
    param :form, 'brand[websites]', :array, :required, 'websites'
    param :form, 'brand[phone_numbers]', :array, :required, 'phone numbers'
  end
  # POST /api/v2/dashboard/brands
  # POST /api/v2/dashboard/brands.json
  def create
    @brand = Brand.new(brand_params)
    render json: @brand.errors unless @brand.save
  end

  swagger_api :update do
    summary 'update Brand'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :required, 'Brand ID'
    param :form, 'brand[name]', :string, :required, 'Brand Name'
    param :form, 'brand[display_name]', :string, :required, 'Brand display Name'
    param :form, 'brand[following_standards]', :boolean, :required, 'Following Standards'
    param :form, 'brand[category_id]', :integer, :required, 'Category ID'
    param :form, 'brand[organization_id]', :integer, :required, 'Organization ID'
    param :form, 'brand[organization_manager_id]', :integer, :required, 'Organization Manager ID'
    param :form, 'brand[logo]', :string, :required, 'Brand Logo'
    param :form, 'brand[dark_logo]', :string, :required, 'Brand dark logo'
    param :form, 'brand[description]', :string, :required, 'Brand description'
    param :form, 'brand[youtube]', :string, :required, 'Youtube Link'
    param :form, 'brand[instagram]', :string, :required, 'Instagram Link'
    param :form, 'brand[facebook]', :string, :required, 'Facebook Link'
    param :form, 'brand[twitter]', :string, :required, 'Twitter Link'
    param :form, 'brand[banner_image]', :string, :required, 'Brand banner image'
    param :form, 'brand[sat]', :boolean, :required, 'sat'
    param :form, 'brand[sun]', :boolean, :required, 'sun'
    param :form, 'brand[mon]', :boolean, :required, 'mon'
    param :form, 'brand[tue]', :boolean, :required, 'tue'
    param :form, 'brand[wed]', :boolean, :required, 'wed'
    param :form, 'brand[thu]', :boolean, :required, 'thu'
    param :form, 'brand[fri]', :boolean, :required, 'fri'
    param :form, 'brand[from]', :string, :required, 'from'
    param :form, 'brand[to]', :string, :required, 'to'
    param :form, 'brand[websites]', :array, :required, 'websites'
    param :form, 'brand[phone_numbers]', :array, :required, 'phone numbers'
  end
  # PATCH/PUT /api/v2/dashboard/brands/1
  # PATCH/PUT /api/v2/dashboard/brands/1.json
  def update
    render json: @brand.errors unless @brand.update(brand_params)
  end

  swagger_api :destroy do
    summary 'Deletes an existing Brand'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :optional, 'Brand Id'
    response :unauthorized
    response :not_found
  end
  # DELETE /api/v2/dashboard/brands/1
  # DELETE /api/v2/dashboard/brands/1.json
  def destroy
    @brand.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_brand
    @brand = if current_manager
               Brand.find_by!(id: params[:id], organization_id: current_manager.organization_id)
             else
               Brand.find(params[:id])
             end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def brand_params
    params.require(:brand).permit(:name, :display_name, :following_standards, :category_id,
                                  :organization_id, :logo, :dark_logo, :description,
                                  :pinterest, :youtube, :snapchat, :google_plus, :organization_manager_id,
                                  :facebook, :twitter, :instagram, :banner_image,
                                  :sat, :sun, :mon, :tue, :wed, :thu, :fri, :from, :to,
                                  :stock_management, categories: [], manager_ids: [], employee_user_ids: [],
                                                     websites: [], phone_numbers: [])
  end
end
