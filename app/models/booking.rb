class Booking < ApplicationRecord
  validates :start_date, :end_date, presence: true
  validate :check_dates
  belongs_to :gear
  belongs_to :user

  def check_dates
    errors.add(:end_date, "End date should be before start date") if end_date > start_date
  end

end
