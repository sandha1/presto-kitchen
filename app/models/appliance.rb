class Appliance < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :price, numericality: { only_integer: true }
  validates :capacity, presence: true
  validates :capacity, numericality: { only_integer: true }
  validates :capacity, inclusion: { in: (1..20) }
  validates :city, presence: true
end
