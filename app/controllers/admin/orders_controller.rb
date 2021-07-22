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
    
  end
  
  private
  def order_params
    params.require(:order).permit(:total_price,:payment,:order_status,:postage,:name,:postal_code,:address)
  end
  
end
