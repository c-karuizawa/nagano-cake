class Admin::OrderItemsController < ApplicationController
    before_action :authenticate_admin_admin!
   def update
      @order_item = OrderItem.find(params[:id])
      @order_item.update(order_item_params)
    #   制作ステータスと注文ステータスの紐付け
    # paramsのデータを取得する記述(enumの場合は文字列で出力される)
    if params[:order_item][:product_status] ==  "make"
      @order_item.order.update(order_status: "make")
    elsif params[:order_item][:product_status] == "finish"
      @order_item.order.update(order_status: "preparing")
    end
    redirect_to admin_order_path(@order_item.order.id)
   end
    
    private
    def order_item_params
      params.require(:order_item).permit(:quantity,:product_status,:taxin_price)
    end
end
