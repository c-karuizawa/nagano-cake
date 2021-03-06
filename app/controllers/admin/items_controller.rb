class Admin::ItemsController < ApplicationController
  
  before_action :authenticate_admin_admin!
  
  def new
    @item = Item.new
    @genres=Genre.all
  end

  def create
    @item=Item.new(item_params)
    if @item.save
    redirect_to admin_item_path(@item), notice:"登録完了しました！"
    else
    render :new
    end
  end

  def edit
    @item=Item.find(params[:id])
    @genres=Genre.all
  end

  def update
    @item=Item.find(params[:id])
    if @item.update(item_params)
    redirect_to admin_item_path(@item),notice:"更新完了しました！"
    else
    render:edit
    end
  end

  def index
    # １ぺーじ１０けんまでしか表示しません。
    @items=Item.page(params[:page]).per(10)
  end

  def show
    @item=Item.find(params[:id])
    
  end
  
  private
  def item_params
    params.require(:item).permit(:image,:name,:introduction,:price,:on_sale,:genre_id)
    # ジャンルについては未設定です
  end

end
