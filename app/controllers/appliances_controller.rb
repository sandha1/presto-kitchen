class AppliancesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @appliances = Appliance.all
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

  private

  def appliance_params
    params.require(:appliance).permit(:name, :description, :price, :city, :capacity)
  end
end
