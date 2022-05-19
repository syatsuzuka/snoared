class Booking < ApplicationRecord
  validates :start_date, :end_date, presence: true
  validate :check_status
  validate :check_dates
  validate :check_start_date
  validate :double_booking
  belongs_to :gear
  belongs_to :user

  def check_status
    unless ["Available", "Requested", "Accepted", "Canceled"].include?(status)
      errors.add(:status, "Unsupposed status was allocated: #{status}")
    end
  end

  def check_dates
    errors.add(:end_date, "End date should be before start date") if end_date < start_date
  end

  def check_start_date
    errors.add(:start_date, "Start date should be after today") if start_date < Date.today
  end

  def double_booking
    bookings = Booking.where(gear: gear)
    overlap = bookings.select { |booking| (start_date - booking.end_date) * (booking.start_date - end_date) > 0  }
    unless overlap.blank?
      overlap.each do |booking|
        if booking.status != "Canceled" and booking.id != id
          errors.add(:start_date, "Double booking: #{gear.title}")
          errors.add(:end_date, "Double booking: #{gear.title}")
        end
      end
    end
  end
end
