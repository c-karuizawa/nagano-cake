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
    if params[:address] == "home"
      @order.postal_code = @customer.postal_code
      @order.address = @customer.address
      @order.name = @customer.name
    elsif params[:address] == "locations"
      @order.postal_code = @locations.postal_code
      @order.address = @locations.address
      @order.name = @locations.name
    elsif params[:address] == "new"
      @order.postal_code = params[:postal_code]
      @order.address = params[:address]
      @order.name = params[:name]
    end
  end

  def create
    Order.create!(session[:order])
    session.delete(:order)
  end

  def done
  end

  def index
  end

  def show
  end

  private
    def permit_params
      @attr = params.require('order').permit(:id, :name, :postal_code, :address)
    end

end