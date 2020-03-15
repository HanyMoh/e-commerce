class Api::V2::Cashier::SubProductsController < Api::V2::Cashier::ApiBaseController
  before_action :set_sub_product, only: %i[show edit update destroy]

  swagger_controller :sub_products, 'Cashier Sub Products'

  swagger_api :index do
    summary 'Get all sub products for current employee or manager'
    notes <<-eos
      Sending `manager token` as <b>X-User-Token</b> will return all sub_products of the current manager organization.<br />
      Sending `employee user token` as <b>X-User-Token</b> will return all sub_products of the current employee shop.<br />
    eos
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
  end
  # GET /api/v2/dashboard/sub_products
  # GET /api/v2/dashboard/sub_products.json
  def index
    @sub_products = if current_employee
                      Shop.find(current_employee.shop_id).sub_products.newest_first.per_page(params[:page])
                    elsif current_manager
                      SubProduct.where(organization_id: current_manager.organization_id).newest_first.per_page(params[:page])
                    else
                      SubProduct.newest_first.per_page(params[:page])
                    end
    @sub_product = @sub_products.by_barcode(params[:barcode]) if params[:barcode]
    # Get sub_products attached with main products and exclude the one already selected
    excluded_id = @sub_product.id
    @related_products = @sub_product.product.sub_products.where.not(id: excluded_id)
  end

  swagger_api :show do
    summary 'Show a sub product by id'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :required, 'Sub Product ID'
    response :not_found
  end
  # GET /api/v2/dashboard/sub_products/1
  # GET /api/v2/dashboard/sub_products/1.json
  def show; end

  swagger_api :update do
    summary 'update sub product'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :required, 'Sub Product ID'
    param :form, 'sub_product[shop_id]', :integer, :required, 'Shop ID'
    param :form, 'sub_product[brand_id]', :integer, :required, 'Brand ID'
    param :form, 'sub_product[product_id]', :integer, :required, 'Product ID'
    param :form, 'sub_product[organization_id]', :integer, :required, 'Organization ID'
    param :form, 'sub_product[barcode]', :string, :required, 'Barcode'
    param :form, 'sub_product[price]', :float, :required, 'Price'
    param :form, 'sub_product[discount]', :float, :required, 'Discount'
    param :form, 'sub_product[color]', :string, :required, 'Color'
    param :form, 'sub_product[size]', :string, :required, 'Size'
    param :form, 'sub_product[quantity]', :integer, :required, 'Quantity'
    param :form, 'sub_product[cover_image]', :string, :required, 'Cover Image'
    param :form, 'sub_product[gallery]', :string, :required, 'Gallery'
  end
  # PATCH/PUT /api/v2/dashboard/sub_products/1
  # PATCH/PUT /api/v2/dashboard/sub_products/1.json
  def update
    render json: @sub_product.errors unless @sub_product.update(sub_product_params)
  end

  swagger_api :destroy do
    summary 'Deletes an existing Sub Product'
    param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
    param :header, 'X-User-Token', :string, :required, 'User Token'
    param :path, :id, :integer, :optional, 'Sub Product Id'
    response :unauthorized
    response :not_found
  end
  # DELETE /api/v2/dashboard/sub_products/1
  # DELETE /api/v2/dashboard/sub_products/1.json
  def destroy
    render json: { message: 'Sub Product deleted successfully', status: :ok } if @sub_product.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sub_product
    @sub_product = if current_employee
                     SubProduct.find_by!(id: params[:id], shop_id: current_employee.shop_id)
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
