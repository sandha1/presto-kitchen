class BookingsController < ApplicationController

  def index
    @bookings = @user.booking
  end


  private
  def set_user
    @user = User.find(params[:user_id])
  end

end
