class Public::LocationsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @customer = current_customer
    @locations = @customer.locations
    @location_new = Location.new
  end

  def create
    @customer = current_customer
    @location_new = Location.new(location_params)
    @location_new.customer_id = @customer.id
    if @location_new.save
      redirect_back(fallback_location: root_path)
    else
      @locations = @customer.locations
      render 'index'
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update(location_params)
      redirect_to locations_path
    else
      render 'edit'
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_back(fallback_location: root_path)
  end

  private
    def location_params
      params.require(:location).permit(:postal_code, :address, :name)
    end

end
