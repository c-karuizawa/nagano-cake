class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
    @locations = @customer.locations
  end

  def confirm
  end

  def create
  end

  def done
  end

  def index
  end

  def show
  end
end