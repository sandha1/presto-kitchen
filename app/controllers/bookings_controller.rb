class BookingsController < ApplicationController
  before_action :set_user, only: [:new, :my_bookings, :create, :show, :accept, :decline]
  private
  def set_user
    @user = User.find(params[:user_id])
  end
  # end

  def new
    @booking = Booking.new
  end

  # def my_bookings
  #   @appliances = Appliance.joins(:bookings).where(bookings: { user_id: current_user.id })
  # end

  def create
    @appliance = Appliance.find(params[:appliance_id])
    @booking = Booking.new(set_params)
    @booking.appliance = @appliance
    @booking.user_id = current_user.id
    @booking.accepted = nil
      if @booking.save
         redirect_to appliance_booking_path(@appliance, @booking)
      else
        render :new, status: :unprocessable_entity
      end
  end

  def show
    @booking = Booking.find(params[:id])
    @appliance = @booking.appliance
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.accepted = true
    @appliance = @booking.appliance
    if @booking.save
      redirect_to my_dashboard_path(@appliance, @booking)
    else
     render :new, status: :unprocessable_entity
    end
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.accepted = false
    @appliance = @booking.appliance
    if @booking.save
      redirect_to my_dashboard_path(@appliance, @booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_params
    params.require(:booking).permit(:appliance_id, :start_date, :end_date, :accepted)
  end
end
