class Gear < ApplicationRecord
  belongs_to :user
  has_many :users, through: :bookings

  validates :title, :description, :price, :address, presence: true
end
