class Api::V2::Navbox::SubProductsController < Api::V2::Navbox::ApiBaseController
  before_action :set_sub_product, only: %i[show edit update destroy]

  # GET /api/v2/dashboard/sub_products
  # GET /api/v2/dashboard/sub_products.json
  def index
    @sub_products = if current_manager
                      SubProduct.where(organization_id: current_manager.organization_id).newest_first
                    else
                      SubProduct.newest_first
                    end
    @sub_products = @sub_products.by_barcode(params[:barcode]) if params[:barcode]
    @sub_products = @sub_products.by_shop(params[:shop_id]) if params[:shop_id]
  end

  # GET /api/v2/dashboard/sub_products/1
  # GET /api/v2/dashboard/sub_products/1.json
  def show; end

  # POST /api/v2/dashboard/sub_products
  # POST /api/v2/dashboard/sub_products.json
  def create
    @sub_product = SubProduct.new(sub_product_params)
    render json: @sub_product.errors unless @sub_product.save
  end

  # PATCH/PUT /api/v2/dashboard/sub_products/1
  # PATCH/PUT /api/v2/dashboard/sub_products/1.json
  def update
    render json: @sub_product.errors unless @sub_product.update(sub_product_params)
  end

  # DELETE /api/v2/dashboard/sub_products/1
  # DELETE /api/v2/dashboard/sub_products/1.json
  def destroy
    @sub_product.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sub_product
    @sub_product = if current_manager
                     SubProduct.find_by!(id: params[:id], organization_id: current_manager.organization_id)
                   else
                     SubProduct.find(params[:id])
                   end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def sub_product_params
    params.require(:sub_product).permit(:product_id, :shop_id, :brand_id,
                                        :organization_id, :barcode, :price,
                                        :discount, :color, :size, :quantity,
                                        :cover_image, gallery: [])
  end
end
