class Admin::OrdersController < ApplicationController
  def index
    @orders=Order.page(params[:page]).per(10)
  end

  def show
    @order=Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
  end
  
  private
  def order_params
    params.require(:order).permit(:total_price,:payment,:order_status,:postage,:name,:postal_code,:address)
     t.integer "customer_id", null: false
  end
  
end
