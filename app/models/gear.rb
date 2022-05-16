class Gear < ApplicationRecord
  has_one :user

  validates :title, :description, :price, :address, presence: true
end
