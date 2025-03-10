class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :appliances, dependent: :destroy
  has_many :bookings, dependent: :destroy

  has_many :bookings_as_owner, through: :appliances, source: :bookings

  validates :username, presence: true, uniqueness: true
end
