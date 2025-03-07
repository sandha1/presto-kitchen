class BookingsController < ApplicationController

  # private
  # def set_user
    # @user = User.find(params[:user_id])
  # end


  def new
    @booking = Booking.new
  end

  def create
    @appliance = Appliance.find(params[:appliance_id])
    if @appliance.user == current_user
      redirect_to my_appliances_path
    else
      @booking = Booking.new(set_params)
      @booking.appliance = @appliance
      @booking.user_id = current_user.id
      @booking.accepted = nil
      if @booking.save
         redirect_to appliance_booking_path(@appliance, @booking)
      else
        render "appliances/show", status: :unprocessable_entity
      end
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
     render "pages/my_dashboard", status: :unprocessable_entity
    end
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.accepted = false
    @appliance = @booking.appliance
    if @booking.save
      redirect_to my_dashboard_path(@appliance, @booking)
    else
      render "pages/my_dashboard", status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[id])
    @booking.destroy
    redirect_to my_bookings_path, status: :see_other
  end

  private

  def set_params
    params.require(:booking).permit(:appliance_id, :start_date, :end_date, :accepted)
  end
end
