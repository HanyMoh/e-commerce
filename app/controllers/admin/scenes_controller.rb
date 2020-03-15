class Admin::ScenesController < Admin::BaseAdminController
  load_and_authorize_resource
  before_action :set_shop360, except: :update
  before_action :set_shop_floor, except: :update
  before_action :set_shop_section, except: :update

  def new; end

  def create
    if @scene.save
      flash[:notice] = 'Scene has been added'
      redirect_to admin_shop360_shop_floor_shop_section_scenes_path(@shop360, @shop_floor, @shop_section)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @scene.update(scene_params)
      flash[:notice] = 'Scene has been updated'
      redirect_to admin_shop360_shop_floor_shop_section_scenes_path(@scene.shop_section.shop_floor.shop360,
                                                                    @scene.shop_section.shop_floor,
                                                                    @scene.shop_section)
    else
      render 'edit'
    end
  end

  def index
    @scenes = @shop_section.scenes
  end

  def destroy
    return unless @scene.destroy
    flash[:notice] = 'Scene was removed'
    redirect_to admin_shop360_shop_floor_shop_section_scenes_path(@shop360, @shop_floor, @shop_section)
  end

  private

  def scene_params
    params.require(:scene).permit(:name, :image, :shop_section_id, :organization_id)
  end

  def set_shop360
    @shop360 = Shop360.find(params[:shop360_id])
  end

  def set_shop_floor
    @shop_floor = ShopFloor.find(params[:shop_floor_id])
  end

  def set_shop_section
    @shop_section = ShopSection.find(params[:shop_section_id])
  end
end
