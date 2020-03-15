class Admin::SubProductsController < Admin::BaseAdminController
  load_and_authorize_resource
  before_action :set_product_brand_and_shop, only: %i[new edit index]

  def new; end

  def create
    if @sub_product.save
      if @sub_product.brand.following_standards? && ProductRepository.where(barcode: @sub_product.barcode).none?
        ProductRepository.create(name: @sub_product.product.name, price: @sub_product.price, description: @sub_product.product.description,
                                 barcode: @sub_product.barcode)
      end
      flash[:notice] = 'Product has been added to this store'
    else
      flash[:error] = @sub_product.errors.full_messages
    end
    redirect_to admin_product_sub_products_path(@sub_product.product.id)
  end

  def edit; end

  def update
    if @sub_product.update(sub_product_params)
      flash[:notice] = 'Product has been updated'
      redirect_to admin_product_sub_products_path(@sub_product.product.id)
    end
  end

  def index; end

  def destroy
    return unless @sub_product.destroy
    flash[:notice] = 'Product was deleted from this store'
    redirect_to admin_product_sub_products_path(@sub_product.product.id)
  end

  def set_cover_image
    @sub_product = SubProduct.find(params[:product_id])
    @sub_product.gallery_index = params[:cover_image]
    @sub_product.save
  end

  private

  def set_product_brand_and_shop
    @product = Product.find(params[:product_id])
    @brand = @product.brand
    @shops = @brand.shops
  end

  def sub_product_params
    params.require(:sub_product).permit(:product_id, :shop_id, :brand_id,
                                        :organization_id, :barcode, :price,
                                        :discount, :color, :size, :quantity,
                                        :cover_image, gallery: [])
  end
end
