class Admin::ShopSectionsController < Admin::BaseAdminController
  load_and_authorize_resource
  before_action :set_shop360, except: :update
  before_action :set_shop_floor, except: :update

  def new; end

  def create
    if @shop_section.save
      flash[:notice] = 'Section has been created'
      redirect_to admin_shop360_shop_floor_shop_sections_path(@shop360, @shop_floor)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @shop_section.update(shop_section_params)
      flash[:notice] = 'Section has been updated'
      redirect_to admin_shop360_shop_floor_shop_sections_path(@shop_section.shop_floor.shop360, @shop_section.shop_floor)
    else
      render 'edit'
    end
  end

  def index
    @shop_sections = @shop_floor.shop_sections
  end

  def destroy
    return unless @shop_section.destroy
    flash[:notice] = 'Section was deleted'
    redirect_to admin_shop360_shop_floor_shop_sections_path(@shop360, @shop_floor)
  end

  private

  def shop_section_params
    params.require(:shop_section).permit(:name, :image, :shop_floor_id, :organization_id)
  end

  def set_shop360
    @shop360 = Shop360.find(params[:shop360_id])
  end

  def set_shop_floor
    @shop_floor = ShopFloor.find(params[:shop_floor_id])
  end
end
