class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    # .allなくてもいけた　
    @cart_items= current_customer.cart_items.all
    # カートに入ってる商品の合計金額
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

    def create
      @cart_item = CartItem.new(params_cart_item)
      # 商品詳細ページで、カスタマーid紐付けてるから、以下いらないかも
      @cart_item.customer_id=current_customer.id
      @cart_items=current_customer.cart_items.all
        @cart_items.each do |cart_item|
          if cart_item.item_id==@cart_item.item_id
          new_quantity = cart_item.quantity + @cart_item.quantity
          cart_item.update_attribute(:quantity, new_quantity)
          @cart_item.delete
          end
        end
        @cart_item.save
        redirect_to cart_items_path,notice:"カートに商品が入りました"
    
    end

  

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(quantity: params[:quantity].to_i)
    redirect_to cart_items_path,notice:"数量が更新されました"
  end


  def destroy
    @cart_item = CartItem.find(params[:id])
    if @cart_item.destroy
      redirect_to cart_items_path
    end
  
  end
  

  def all_destroy
    @cart_items= current_customer.cart_items.all
    # ここの_allはないとエラーになります
    @cart_items.destroy_all
    redirect_to cart_items_path
  end
  
  private
  def params_cart_item
    params.require(:cart_item).permit(:quantity, :item_id,:customer_id)
  end
  
end
