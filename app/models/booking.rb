class Booking < ApplicationRecord
  belongs_to :appliance
  belongs_to :user
end
