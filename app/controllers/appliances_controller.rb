class AppliancesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_appliance, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      @appliances = Appliance.search_by_name_and_description(params[:query])
    else
      @appliances = Appliance.all
    end

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
  end

  def show
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

  def edit
  end

  def update
    @appliance.update(appliance_params)
    if @appliance.save
      redirect_to appliance_path(@appliance)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @appliance.destroy
    redirect_to my_appliances_path, status: :see_other
  end

  private

    def set_appliance
      @appliance = Appliance.find(params[:id])
    end

    def appliance_params
      params.require(:appliance).permit(:name, :description, :price, :city, :capacity, :photo)
  end
end
