class Admin::OrderItemsController < ApplicationController
    before_action :authenticate_admin_admin!
   def update
      @order_item = OrderItem.find(params[:id])
      @order_item.update(order_item_params)
    #   制作ステータスと注文ステータスの紐付け
    # if product_status == 2
    #   @order_item.order.order_status.update(2)
    # elsif product_status == 3
    #   @order_item.order.order_status.update(3)
    # end
   end
    
    private
    def order_item_params
      params.require(:order_item).permit(:quantity,:product_status,:taxin_price)
    end
end
