class Admin::OrdersController < ApplicationController
  def index
    @orders=Order.page(params[:page]).per(10)
  end

  def show
    @order =Order.find(params[:id])
    order_items = @order.order_items
    @total = order_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    #   注文ステータスと制作ステータスの紐付け
     # paramsのデータを取得する記述(enumの場合は文字列で出力される)
    # p params[:order][:order_status]
    if params[:order][:order_status] == "payment"
      @order.order_items.update(product_status: "make_wait")
    end
    redirect_to admin_order_path(@order.id)
  end
  
  private
  def order_params
    params.require(:order).permit(:total_price,:payment,:order_status,:postage,:name,:postal_code,:address)
  end
  
end
