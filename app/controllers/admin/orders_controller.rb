class Admin::OrdersController < Admin::BaseAdminController
  load_and_authorize_resource
  before_action :set_order, only: :edit

  def edit; end

  def update
    if @order.update(order_params)
      respond_with(@order, location: admin_order_path(@order)) if @order.save
    else
      render 'edit'
    end
  end

  def index
    @q = Order.ransack(params[:q])
    @orders = @q.result(distinct: true).per_page(params[:page])
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:status)
  end
end
