class Booking < ApplicationRecord
  belongs_to :gear
  belongs_to :user
end
