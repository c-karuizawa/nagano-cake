class Public::OrdersController < ApplicationController
  before_action :permit_params, only: :confirm

  def new
    session.delete(:order)
    @order = Order.new
    @customer = current_customer
    @locations = @customer.locations
  end

  def confirm
    @customer = current_customer
    @cart_items = @customer.cart_items
    @locations = @customer.locations
    @order = Order.new(@attr)
    session[:order] = @order
    if params[:locate] == "0"
      session[:order][:postal_code] = @customer.postal_code
      session[:order][:address] = @customer.address
      session[:order][:name] = @customer.last_name + @customer.first_name
      session[:order][:customer_id] = current_customer.id
      # @cart_items.each do |item|
      #   @sum += (item.item.price * item.quantity)
      # end
      # session[:order][:total_price] = @sum + @order.postage

      # カート関連未実装のため一時的に記載
      session[:order][:total_price] = "1000"
    elsif params[:locate] == "1"
      location = @locations.find(params[:order][:locate_id])
      session[:order][:postal_code] = location.postal_code
      session[:order][:address] = location.address
      session[:order][:name] = location.name
      session[:order][:customer_id] = current_customer.id
      # カート関連未実装のため一時的に記載
      session[:order][:total_price] = "1000"
    elsif params[:locate] == "2"
      @order = Order.new(@attr)
      session[:order][:customer_id] = current_customer.id
      # カート関連未実装のため一時的に記載
      session[:order][:total_price] = "1000"
    end
  end

  def create
  end

  def done
    Order.create!(session[:order])
    # @cart_items = current_customer.cart_items
    # @cart_items.each do |cart|
    #   OrderItem.create!(order: session[:order],
    #                     item_id: cart.item_id,
    #                     quantity: cart.quantity,
    #                     taxin_price: cart.item.taxin_price
    #                   )
    # end
    session.delete(:order)
  end

  def index
    @customer = current_customer
    @orders = @customer.orders
  end

  def show
    customer = current_customer
    orders = customer.orders
    @order = orders.where(id: params[:id])
  end

  private
    def permit_params
      @attr = params.require(:order).permit(:id, :name, :postal_code, :address, :payment, :customer_id, :total_price)
    end

end