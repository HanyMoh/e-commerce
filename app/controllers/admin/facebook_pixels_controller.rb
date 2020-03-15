class Admin::FacebookPixelsController < Admin::BaseAdminController
  load_and_authorize_resource
  skip_load_resource only: %i[index]
  before_action :set_shops, only: %i[new edit]

  def new; end

  def create
    if params[:fbp_radio] == 'one_store'
      if @facebook_pixel.save
        flash[:notice] = 'Facebook pixel has been added for your store'
        redirect_to admin_facebook_pixels_path
      else
        render 'new'
      end
    else
      @facebook_pixel.general = true
      if @facebook_pixel.save
        flash[:notice] = 'Facebook pixel has been added for all of your stores'
        redirect_to admin_facebook_pixels_path
      else
        render 'new'
      end
    end
  end

  def edit; end

  def update
    if params[:fbp_radio] == 'one_store'
      @facebook_pixel.general = false
      if @facebook_pixel.update(facebook_pixel_params)
        flash[:notice] = 'Facebook pixel has been updated'
        redirect_to admin_facebook_pixels_path
      else
        render 'new'
      end
    elsif params[:fbp_radio] == 'all_stores'
      @facebook_pixel.general = true
      @facebook_pixel.shop_id = nil
      if @facebook_pixel.update(facebook_pixel_params)
        flash[:notice] = 'Facebook pixel has been set for all of your stores'
        redirect_to admin_facebook_pixels_path
      else
        render 'new'
      end
    elsif params[:fbp_radio] == 'same_store'
      if @facebook_pixel.update(facebook_pixel_params)
        flash[:notice] = 'Facebook pixel has been updated'
        redirect_to admin_facebook_pixels_path
      else
        render 'new'
      end
    end
  end

  def index
    @facebook_pixel = FacebookPixel.where(employee_user: current_employee_user, general: true)
    if @facebook_pixel.any?
      @facebook_pixels = @facebook_pixel
      @general_pixel = 'true'
    else
      @facebook_pixels = FacebookPixel.where(employee_user: current_employee_user)
      @general_pixel = 'false'
    end
  end

  def destroy
    if @facebook_pixel.destroy
      flash[:notice] = 'Facebook Pixel was removed'
      redirect_to admin_facebook_pixels_path
    end
  end

  private

  def facebook_pixel_params
    if params[:fbp_radio] == 'one_store'
      params.require(:facebook_pixel).permit(:pixel_id, :shop_id, :employee_user_id)
    elsif params[:fbp_radio] == 'all_stores'
      params.require(:facebook_pixel).permit(:pixel_id, :employee_user_id)
    elsif params[:fbp_radio] == 'same_store'
      params.require(:facebook_pixel).permit(:pixel_id)
    end
  end

  def set_shops
    existing_shops_pixels = FacebookPixel.where(employee_user: current_employee_user).pluck(:shop_id)
    @shops = []
    manager_or_employee_brands.each do |brand|
      brand.shops.reorder(brand_id: :desc).order(id: :asc).each do |shop|
        @shops << shop unless existing_shops_pixels.include?(shop.id)
      end
    end
  end
end
