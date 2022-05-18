class BookingsController < ApplicationController
  before_action :set_gear, only: %i[new create]

  def index
    @bookings = policy_scope(Booking).sort_by { |booking| booking.start_date }.reverse
  end

  def update
  end

  def new
    @booking = Booking.new
    @gear.user = current_user
    @booking.gear = @gear
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.gear = @gear
    @booking.user = current_user
    @booking.status = "Requested"
    authorize @booking

    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def all
    @bookings = policy_scope(Booking)
    authorize @bookings
    @bookings.sort_by { |booking| booking.start_date }.reverse
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status, :user_id, :gear_id)
  end

  def set_gear
    @gear = Gear.find(params[:gear_id])
  end
end
