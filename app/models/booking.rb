class Booking < ApplicationRecord
  belongs_to :appliance
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :end_date, comparison: { greater_than: :start_date }

  after_validation :calculate_total_price

  def calculate_total_price
    total_days = end_date - start_date
    self.total_price = total_days * appliance.price
  end
end
