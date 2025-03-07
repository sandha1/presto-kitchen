class Appliance < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_by_name_and_description,
    against:  {
      name: 'A',
      description: 'B',
    },
    using: {
      tsearch: { prefix: true }
    }

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

  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?

  def coordinates_present?
    latitude.present? && longitude.present?
  end

end
