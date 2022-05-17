class GearsController < ApplicationController
  def index
    @gears = policy_scope(Gear)
  end

  def show
    @booking = Booking.new
    @gear = Gear.find(params[:id])
    authorize @gear
  end

  def new
    @gear = Gear.new
    authorize @gear
  end

  def create
  end
end
