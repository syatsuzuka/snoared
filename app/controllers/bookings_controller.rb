class BookingsController < ApplicationController
  before_action :set_gear, only: %i[new create cancel edit update review accept reject]
  before_action :set_booking, only: %i[cancel edit update accept reject]

  def index
    @bookings = policy_scope(Booking).sort_by { |booking| booking.start_date }.reverse
  end

  def new
    @booking = Booking.new
    @booking.user = current_user
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

  def edit
    @booking.gear = @gear
    @booking.user = current_user
    authorize @booking
  end

  def update
    @booking.status = "Canceled"
    authorize @booking

    if @booking.save!
      redirect_to bookings_path
    else
      render :cancel
    end
  end

  def admin
    @bookings = policy_scope(Booking)
    authorize @bookings
    @bookings.sort_by { |booking| booking.start_date }.reverse
  end

  def accept
    @booking.status = 'Accepted'
    authorize @booking

    if @booking.save!
      redirect_to review_gear_bookings_path(@booking.gear)
    else
      render accept_gear_booking_path(@booking.gear, @booking)
    end
  end

  def reject
    @booking.status = 'Rejected'
    authorize @booking

    if @booking.save!
      redirect_to review_gear_bookings_path(@booking.gear)
    else
      render reject_gear_booking_path(@booking.gear, @booking)
    end
  end

  def cancel
    authorize @booking
  end

  def review
    @bookings = Booking.where(gear: @gear)
    authorize @bookings
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
