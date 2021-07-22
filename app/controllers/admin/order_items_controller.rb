class Admin::OrderItemsController < ApplicationController
   def update
      @order_item = OrderItem.find(params[:id])
      @order_item.update(order_item_params)
    #   制作ステータスと注文ステータスの紐付け
    if params[:order_item][:product_status] ==  2
      @order_item.order.update(order_status: 2)
    elsif params[:order_item][:product_status] == 3
      @order_item.order.update(order_status: 3)
    end
    redirect_to admin_order_path(@order_item.order.id)
   end
    
    private
    def order_item_params
      params.require(:order_item).permit(:quantity,:product_status,:taxin_price)
    end
end
