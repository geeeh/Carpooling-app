# frozen_string_literal: true

class VehiclesController < ApplicationController
  before_action :authenticate_user!
  def index
    @vehicles = Vehicle.all
  end

  def new
    @vehicle = Vehicle.new
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.save
      flash[:notice] = 'vehicles added!'
      redirect_to root_url
    else
      flash[:error] = 'Failed to create new vehicles!'
      render :new
    end
  end

  def update
    @vehicle = Vehicle.find(params[:id])
    if @vehicle.update_attributes(vehicle_params)
      flash[:notice] = 'vehicles updated!'
      redirect_to @vehicle
    else
      flash[:error] = 'Failed to edit vehicles!'
      render :edit
    end
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])
    if @vehicle.delete
      flash[:notice] = 'Vehicle deleted!'
      redirect_to @vehicle
    else
      flash[:error] = 'Failed to delete this vehicles!'
      render :destroy
    end
  end

  # we used strong parameters for the validation of params
  def vehicle_params
    params.require(:vehicle).permit(:make, :colour, :plate, :capacity)
  end
end
