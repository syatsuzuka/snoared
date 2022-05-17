class BookingsController < ApplicationController
  before_action :set_gear, only: %i[create]

  def index
    @bookings = policy_scope(Booking)
  end

  def update
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.gear = @gear
    @booking.user = current_user
    @booking.status = "occupied"
    authorize @booking

    if @booking.save
      redirect_to bookings_path
    else
      redirect_to gear_path(@booking.gear)
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status, :user_id, :gear_id)
  end

  def set_gear
    @gear = Gear.find(params[:gear_id])
  end
end
