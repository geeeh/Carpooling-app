# frozen_string_literal: true

class VehiclesController < ApplicationController
  before_action :authenticate_user!

  def index
    @vehicles = current_user.vehicles
  end

  def new
    @vehicle = Vehicle.new
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  def create
    vehicle = current_user.vehicles.build(vehicle_params)
    if vehicle.save
      flash[:notice] = 'vehicles added!'
      redirect_to action: 'index'
    else
      flash[:error] = vehicle.errors.messages
      render :new
    end
  end

  def update
    @vehicle = Vehicle.find(params[:id])
    if @vehicle.update_attributes(vehicle_params)
      flash[:notice] = 'vehicles updated!'
    else
      flash[:error] = 'Failed to edit vehicles!'
    end
    redirect_to action: 'index'
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])
    if @vehicle.destroy
      flash[:notice] = 'Vehicle deleted!'
    else
      flash[:error] = 'Failed to delete this vehicles!'
    end
    redirect_to action: 'index'
  end

  private

  # we used strong parameters for the validation of params
  def vehicle_params
    params.require(:vehicle).permit(:make, :colour, :plate, :capacity)
  end
end
