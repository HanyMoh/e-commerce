class Admin::ShopsController < Admin::BaseAdminController
  load_and_authorize_resource
  skip_load_resource only: %i[remove_from_360_list]
  before_action :set_sections, only: %i[panoramas_shops panoramas_as_sections]
  def new; end

  def create
    if params['in-out-building'] == 'inside-building'
      mall = Mall.find(params[:shop][:building_id])
      @shop.street = mall.area
    end

    if @shop.save
      initialize_shop360
      cookies['popup'] = params['popup']
      respond_with(@shop, location: admin_shop_path(@shop))
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if params['in-out-building'] == 'inside-building'
      mall = Mall.find(params[:shop][:mall_id])
      @street = mall.area
      # @lat = mall.latitude
      # @lng = mall.longitude
    else
      @shop.building_id = nil
    end
    if @shop.update(shop_params)
      @shop.update(lng: @lng, lat: @lat, street: @street) if params['in-out-building'] == 'inside-building'
      respond_with(@shop, location: admin_shop_path(@shop))
    else
      render 'edit'
    end
  end

  def index
    if check_num_of_shops && !current_admin
      redirect_to action: 'new'
    else
      set_shops
    end
  end

  def show
    @status = cookies['popup']
    cookies.delete :popup
  end

  def panoramas_shops
    set_shops
  end

  def panoramas_as_sections; end

  def panorama_galleries
    set_shops
  end

  def destroy
    return unless @shop.destroy
    flash[:notice] = 'Shop was removed'
    redirect_to admin_shops_path
  end

  def shop360ms
    # This if for the 360 app to get it working
    cookies['X-User-Token'] = current_organization_manager.authentication_token
    cookies['Shop_id'] = @shop.id
  end

  def manage_360
    cookies['manage_360_brand_id'] = params[:brand_id] if params[:brand_id]
    cookies['manage_360_shop_id'] = params[:shop_id] if params[:shop_id]
    @brand = Brand.find(cookies['manage_360_brand_id']) if cookies['manage_360_brand_id']
    @shop = Shop.find(cookies['manage_360_shop_id']) if cookies['manage_360_shop_id']
    @brands = manager_or_employee_brands
    @shops = @brand.shops if cookies['manage_360_brand_id']
    @sub_products = @shop.sub_products.where(popup: true) if @shop

    return unless params[:barcode]
    sub_product = SubProduct.where(shop: @shop, barcode: params[:barcode]).first
    if sub_product
      if sub_product.popup?
        flash[:notice] = 'This product already added to 360 products list'
      else
        sub_product.popup = true
        sub_product.save
        flash[:notice] = 'Product has been added to 360 products list'
      end
    else
      flash[:error] = 'No product in this shop matches this barcode'
    end
    redirect_to manage_360_admin_shops_path
  end

  def clear_selections
    cookies.delete('manage_360_brand_id')
    cookies.delete('manage_360_shop_id')
    redirect_to manage_360_admin_shops_path
  end

  def remove_from_360_list
    sub_product = SubProduct.find(params[:id])
    return unless sub_product.update(popup: false)
    flash[:notice] = 'Product has been removed from the list'
    redirect_to manage_360_admin_shops_path
  end

  private

  def shop_params
    if params['in-out-building'] == 'inside-building'
      params.require(:shop).permit(
        :name, :country, :city, :zip, :brand_id, :mall_id, :floor, :organization_id,
        work_time_attributes: %i[sat sun mon tue wed thu fri opening_at closing_at]
      )
    else
      params.require(:shop).permit(
        :name, :country, :city, :zip, :brand_id, :street, :floor,
        :lat, :lng, :organization_id,
        work_time_attributes: %i[sat sun mon tue wed thu fri opening_at closing_at]
      )
    end
  end

  def check_num_of_shops
    if current_admin
      Shop.joins(:brand).where(brand: Brand.all).count.zero? ? true : false
    else
      Shop.joins(:brand).where(brand: current_active_user.brands).count.zero? ? true : false
    end
  end

  def set_shops
    @q = if current_admin
           Shop.all.ransack(params[:q])
         else
           Shop.where(brand: current_active_user.brands).ransack(params[:q])
         end
    @shops = @q.result(distinct: true).order(brand_id: 'asc').per_page(params[:page])
  end

  def set_sections
    @sections = NewSection.where(employee_user_id: current_active_user.id).per_page(params[:page])
  end

  def initialize_shop360
    Shop360.create(shop: @shop)
  end
end
