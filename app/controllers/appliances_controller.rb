class AppliancesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if @appliances
      @markers = @appliances.geocoded.map do |appliance|
        {
          latitude: appliance.latitude,
          longitude: appliance.longitude,
          name: appliance.name,
          address: appliance.address
        }
      end
    end
    if params[:query].present?
      @appliances = Appliance.search_by_name_and_description(params[:query])
    else
      @appliances = Appliance.all
    end
  end

  def show
    @appliance = Appliance.find(params[:id])
    @booking = Booking.new
  end

  def new
    @appliance = Appliance.new
  end

  def create
    @appliance = Appliance.new(appliance_params)
    @appliance.user = current_user

    if @appliance.save
      redirect_to appliance_path(@appliance)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @appliance = Appliance.find(params[:id])
    @appliance.destroy
    redirect_to my_appliances_path, status: :see_other
  end

  private

  def appliance_params
    params.require(:appliance).permit(:name, :description, :price, :city, :capacity, :photo)
  end
end
