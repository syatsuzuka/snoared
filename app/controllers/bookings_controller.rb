class BookingsController < ApplicationController
  before_action :set_gear, only: %i[new create cancel update]
  before_action :set_booking, only: %i[cancel update]

  def index
    @bookings = policy_scope(Booking).sort_by { |booking| booking.start_date }.reverse
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

  def admin
    @bookings = policy_scope(Booking)
    authorize @bookings
    @bookings.sort_by { |booking| booking.start_date }.reverse
  end

  def cancel
    authorize @booking
  end

  def update
    @booking.status = "Canceled"
    authorize @booking

    if @booking.valid?
      redirect_to bookings_path
    else
      render :cancel
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status, :user_id, :gear_id)
  end

  def set_gear
    @gear = Gear.find(params[:gear_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
