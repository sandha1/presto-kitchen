class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def my_bookings
    @bookings = current_user.bookings
    @appliances = Appliance.where(bookings: @bookings)
  end

def my_appliances
    @appliances = current_user.appliances
    @bookings = Booking.where(appliance: @appliances)
  end

  def my_dashboard
    @bookings = current_user.bookings_as_owner
  end
end
