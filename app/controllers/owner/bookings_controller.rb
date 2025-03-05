module Owner
  class BookingsController < ApplicationController
    def index
      @bookings_as_owner = current_user.bookings_as_owner
    end
  end
end
