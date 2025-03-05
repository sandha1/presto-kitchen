class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
  end


  # private
  # def set_user
    # @user = User.find(params[:user_id])
  # end


  def new
    @booking = Booking.new
  end

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
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.accepted = true
    @appliance = @booking.appliance
    if @booking.save
      redirect_to appliance_booking_path(@appliance, @booking)
    else
     render :new, status: :unprocessable_entity
    end
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.accepted = false
    @appliance = @booking.appliance
    if @booking.save
      redirect_to appliance_booking_path(@appliance, @booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_params
    params.require(:booking).permit(:appliance_id, :start_date, :end_date, :accepted)
  end
end
