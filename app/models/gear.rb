class Gear < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  validates :title, :description, :price, :address, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description_address,
    against: [ :title, :description, :address ],
    using: {
      tsearch: { prefix: true }
    }


end
