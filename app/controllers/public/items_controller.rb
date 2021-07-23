class Public::ItemsController < ApplicationController
  
  
  def top
    @items = Item.order('id DESC').limit(4)
    # ASCだと古い順でDESCで新着順です。
    @genres=Genre.all
  end

  def about
  end

  def index
    @items=Item.page(params[:page]).per(8)
    @genres=Genre.all
  
  end 

  def show
    @item=Item.find(params[:id])
    @cart_item=CartItem.new
    @genres=Genre.all
  end
end
