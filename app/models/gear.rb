class Gear < ApplicationRecord
  has_one :user

  validates :title, :description, :price, presence: true
end
