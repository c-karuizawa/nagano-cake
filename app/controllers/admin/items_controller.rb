class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item=Item.new(item_params)
    if @item.save
    redirect_to admin_item_path(@item)
    else
    render :new
    end
  end

  def edit
    @item=Item.find(params[:id])
  end

  def update
  end

  def index
    @items=Item.page(params[:page]).reverse_order
  end

  def show
    @item=Item.find(params[:id])
  end
  
  private
  def item_params
    params.require(:item).permit(:image,:name,:introduction,:price)
    # ジャンル、販売ステータスについては未設定です
  end

end
