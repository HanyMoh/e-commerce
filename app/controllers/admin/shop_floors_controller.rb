class Admin::ShopFloorsController < Admin::BaseAdminController
  load_and_authorize_resource
  before_action :set_shop360, except: :update

  def new
    @shop_floor.shop_sections.build.scenes.build
  end

  def create
    if @shop_floor.save
      flash[:notice] = 'Floor has been added'
      redirect_to admin_shop360_shop_floors_path(@shop_floor.shop360)
    else
      render 'new'
    end
  end

  def edit
    @shop_floor.shop_sections.build.scenes.build
  end

  def update
    if @shop_floor.update(shop_floor_params)
      flash[:notice] = 'Floor has been updated'
      redirect_to admin_shop360_shop_floors_path(@shop_floor.shop360)
    else
      render 'edit'
    end
  end

  def index
    @shop_floors = @shop360.shop_floors
  end

  def destroy
    return unless @shop_floor.destroy
    flash[:notice] = 'Floor was deleted'
    redirect_to admin_shops_path
  end

  private

  def shop_floor_params
    params.require(:shop_floor).permit(:number, :name, :shop360_id, :organization_id, shop_sections_attributes: [:id, :name, :image, :organization_id, :_destroy,
    scenes_attributes: [:id, :name, :image, :organization_id, :_destroy]])
  end

  def set_shop360
    @shop360 = Shop360.find(params[:shop360_id])
  end
end
