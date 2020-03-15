class Admin::Shop360sController < Admin::BaseAdminController
  load_and_authorize_resource
  before_action :set_shop360

  def preview; end

  def publish
    @shop360.web_json_data = @shop360.preview_json_data
    @shop360.product_position.positions_json_data = @shop360.product_position.preview_json_data
    @shop360.published = true
    @shop360.save
    @shop360.product_position.save
  end

  private

  def set_shop360
    @shop360 = Shop.find(params[:shop_id]).shop360
  end
end
