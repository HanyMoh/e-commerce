class Admin::BuildingsController < Admin::BaseAdminController
  load_and_authorize_resource
  before_action :set_buildings, only: :index

  def index; end

  def show; end

  def new; end

  def create
    if @building.save
      respond_with(@building, location: admin_building_path(@building))
    else
      render 'new'
    end
  end

  def edit
    @building.building_levels.build if params[:floor]
  end

  def update
    if @building.update(building_params)
      @building.shops&.each do |shop|
        shop.street = @building.area
        shop.lng = @building.longitude
        shop.lat = @building.latitude
        shop.save
      end
      respond_with(@building, location: admin_building_path(@building))
    else
      render 'edit', layout: 'main'
    end
  end

  def destroy
    redirect_to admin_buildings_path if @building.destroy
  end

  def building_assets
    @asset = Asset.new
    @building_assets ||= Asset.where(source: @building).first
  end

  private

  def building_params
    allowed_params = [:name, :area, :floors_count, :description,
                      :building_type, :longitude, :latitude, :banner, :logo,
                      building_levels_attributes: %i[id name level
                                                     image organization_id _destroy]]
    (allowed_params << :organization_id) if current_admin
    params.require(:building).permit(allowed_params)
  end

  def set_buildings
    @buildings = Building.newest_first.per_page(params[:page])
  end
end
