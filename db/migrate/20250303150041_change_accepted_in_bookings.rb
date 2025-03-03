class ChangeAcceptedInBookings < ActiveRecord::Migration[7.1]
  def change
    change_column :bookings, :accepted, nil
  end
end
