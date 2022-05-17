class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
  end

  def update
  end

  def create
  end
end
