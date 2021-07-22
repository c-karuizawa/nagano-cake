class Admin::OrdersController < ApplicationController
  def index
    @orders=Order.page(params[:page]).per(10)
  end

  def show
    @order =Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    #   注文ステータスと制作ステータスの紐付け
    if params[:order][:order_status] == 1
      @order.order_item.update(product_status: 1)
    end
    redirect_to admin_order_path(@order.id)
  end
  
  private
  def order_params
    params.require(:order).permit(:total_price,:payment,:order_status,:postage,:name,:postal_code,:address)
  end
  
end
