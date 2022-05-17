class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def update
  end

  def create
  end
end
