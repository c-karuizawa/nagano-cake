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
    # if order_status == 1
    #   @order.order_item.product_status.update(1)
    # elsif order_status == 2
    #   @order.order_item.product_status.update(2)
    # elsif order_status == 3
    #   @order.order_item.product_status.update(3)
    # end
  end
  
  private
  def order_params
    params.require(:order).permit(:total_price,:payment,:order_status,:postage,:name,:postal_code,:address)
  end
  
end
