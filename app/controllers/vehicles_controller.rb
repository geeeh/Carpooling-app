# frozen_string_literal: true

class VehiclesController < ApplicationController
  before_action :authenticate_user!
  before_action :fetch_vehicle, only: %i[update edit destroy]

  def index
    @vehicles = current_user.vehicles
  end

  def new
    @vehicle = Vehicle.new
  end

  def show; end

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
    if @vehicle.update_attributes(vehicle_params)
      flash[:notice] = 'vehicles updated!'
    else
      flash[:error] = 'Failed to edit vehicles!'
    end
    redirect_to action: 'index'
  end

  def edit; end

  def destroy
    if @vehicle.destroy
      flash[:notice] = 'Vehicle deleted!'
    else
      flash[:error] = 'Failed to delete this vehicles!'
    end
    redirect_to action: 'index'
  end

  private

  def fetch_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  # we used strong parameters for the validation of params
  def vehicle_params
    params.require(:vehicle).permit(:make, :colour, :plate, :capacity)
  end
end
