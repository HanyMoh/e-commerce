class Api::V2::Dashboard::FacebookPixelsController < Api::V2::Dashboard::ApiBaseController
  before_action :set_facebook_pixel, only: %i[show edit update destroy]

  swagger_api :index do
    summary 'Get all facebook_pixels for admin or current manager'
    notes <<-eos
      Sending `admin token` as <b>X-User-Token</b> will return all facebook_pixels in the system.<br />
      Sending `manager token` as <b>X-User-Token</b> will return all facebook_pixels of current manager organization.<br />
    eos
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
  end
  # GET /api/v2/dashboard/facebook_pixels
  # GET /api/v2/dashboard/facebook_pixels.json
  def index
    @facebook_pixels = if current_manager
                         FacebookPixel.where(organization_id: current_manager.organization_id).newest_first
                       else
                         FacebookPixel.newest_first
                       end
  end

  swagger_api :show do
    summary 'Show a facebook_pixel by id'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :required, 'FacebookPixel ID'
    response :not_found
  end
  # GET /api/v2/dashboard/facebook_pixels/1
  # GET /api/v2/dashboard/facebook_pixels/1.json
  def show; end

  swagger_api :create do
    summary 'Create Facebook Pixel'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :form, 'facebook_pixel[pixel_id]', :integer, :required, 'Facebook Pixel ID'
    param :form, 'facebook_pixel[shop_id]', :integer, :required, 'Shop ID'
    param :form, 'facebook_pixel[employee_user_id]', :integer, :required, 'Employee User ID'
    param :form, 'facebook_pixel[organization_id]', :integer, :required, 'Organization ID'
  end
  # POST /api/v2/dashboard/facebook_pixels
  # POST /api/v2/dashboard/facebook_pixels.json
  def create
    @facebook_pixel = FacebookPixel.new(facebook_pixel_params)
    render json: @facebook_pixel.errors unless @facebook_pixel.save
  end

  swagger_api :update do
    summary 'Update FacebookPixel'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Authentication Token'
    param :path, :id, :integer, :required, 'FacebookPixel ID'
    param :form, 'facebook_pixel[pixel_id]', :integer, :required, 'Facebook Pixel ID'
    param :form, 'facebook_pixel[shop_id]', :integer, :required, 'Shop ID'
    param :form, 'facebook_pixel[employee_user_id]', :integer, :required, 'Employee User ID'
    param :form, 'facebook_pixel[organization_id]', :integer, :required, 'Organization ID'
  end
  # PATCH/PUT /api/v2/dashboard/facebook_pixels/1
  # PATCH/PUT /api/v2/dashboard/facebook_pixels/1.json
  def update
    render json: @facebook_pixel.errors unless @facebook_pixel.update(facebook_pixel_params)
  end

  swagger_api :destroy do
    summary 'Deletes an existing FacebookPixel'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :optional, 'FacebookPixel Id'
    response :unauthorized
    response :not_found
  end
  # DELETE /api/v2/dashboard/facebook_pixels/1
  # DELETE /api/v2/dashboard/facebook_pixels/1.json
  def destroy
    @facebook_pixel.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_facebook_pixel
    @facebook_pixel = if current_manager
                        FacebookPixel.find_by!(id: params[:id], organization_id: current_manager.organization_id)
                      else
                        FacebookPixel.find(params[:id])
                      end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def facebook_pixel_params
    params.require(:facebook_pixel).permit(:pixel_id, :shop_id, :employee_user_id)
  end
end
