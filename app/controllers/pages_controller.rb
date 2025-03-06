class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def my_bookings
    @bookings = Booking.where(user: current_user)
  end

  def my_appliances
    @appliances = Appliance.where(user: current_user)
    @bookings = Booking.where(user: current_user)
  end

  def my_dashboard
    @bookings = current_user.bookings_as_owner
  end
end
