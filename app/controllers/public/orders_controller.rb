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
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @locations = @customer.locations
    @order = Order.new(@attr)
    session[:order] = @order
    if params[:locate] == "0"
      session[:order][:postal_code] = @customer.postal_code
      session[:order][:address] = @customer.address
      session[:order][:name] = @customer.last_name + @customer.first_name
      session[:order][:customer_id] = @customer.id
      session[:order][:total_price] = @total + @order.postage
    elsif params[:locate] == "1"
      location = @locations.find(params[:order][:locate_id])
      session[:order][:postal_code] = location.postal_code
      session[:order][:address] = location.address
      session[:order][:name] = location.name
      session[:order][:customer_id] = @customer.id
      session[:order][:total_price] = @total + @order.postage
    elsif params[:locate] == "2"
      if session[:order][:postal_code].present? && session[:order][:address].present? && session[:order][:name].present?
        @order = Order.new(@attr)
        session[:order][:customer_id] = @customer.id
        session[:order][:total_price] = @total + @order.postage
      else
        redirect_to new_order_path, alert: 'お届け先を選択または入力してください'
      end
    end
  end

  def create
    order = Order.new(session[:order])
    order.save
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      OrderItem.create!(order_id: order.id,
                        item_id: cart_item.item_id,
                        quantity: cart_item.quantity,
                        taxin_price: cart_item.item.taxin_price
                       )
    end
    session.delete(:order)
    @cart_items.destroy_all
    redirect_to orders_done_path
  end

  def done
  end

  def index
    customer = current_customer
    @orders = customer.orders
  end

  def show
    customer = current_customer
    orders = customer.orders
    @order = orders.find(params[:id])
    order_items = @order.order_items
    @total = order_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  private
    def permit_params
      @attr = params.require(:order).permit(:id, :name, :postal_code, :address, :payment, :customer_id, :total_price)
    end

end