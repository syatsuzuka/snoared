class GearsController < ApplicationController
  def index
    @gears = Gear.all
  end

  def show
    @gear = Gear.find(params[:id])
  end

  def new
    @gear = Gear.new
  end

  def create
  end
end
