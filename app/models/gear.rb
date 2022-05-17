class Gear < ApplicationRecord
  has_one :user
  has_many :users, through: :bookings

  validates :title, :description, :price, :address, presence: true
end
