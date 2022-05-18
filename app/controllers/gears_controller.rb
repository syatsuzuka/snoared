class GearsController < ApplicationController
  before_action :set_gear, only: %w[show]

  def index
    @gears = policy_scope(Gear)
  end

  def show
    authorize @gear
    @booking = Booking.new
    @booking.gear = @gear
  end

  def new
    @gear = Gear.new
    authorize @gear
  end

  def create
  end

  private

  def set_gear
    @gear = Gear.find(params[:id])
  end
end
