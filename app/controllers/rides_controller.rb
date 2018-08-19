# frozen_string_literal: true

# Ride controller class
# This is the controller responsible on all Ride actions.
class RidesController < ApplicationController
  def index
    @rides = Ride.all
  end

  def new
    @ride = Ride.new
  end

  def show
    @ride = Ride.find(params[:id])
  end

  def edit
    @ride = Ride.find(params[:id])
  end

  def create
    ride = Ride.new(ride_params)
    ride.user_id = current_user.id
    if ride.save
      flash[:notice] = 'ride added!'
      redirect_to action: 'index'
    else
      flash[:error] = ride.errors.messages
      render :new
    end
  end

  def update
    ride = Ride.find(params[:id])
    if ride.update_attributes(ride_params)
      flash[:notice] = 'ride updated!'
      redirect_to action: 'index'
    else
      flash[:error] = 'Failed to edit ride!'
      render :edit
    end
  end

  def destroy
    ride = Ride.find(params[:id])
    if ride.delete
      flash[:notice] = 'Ride deleted!'
      redirect_to action: 'index'
    else
      flash[:error] = 'Failed to delete this vehicles!'
      render :destroy
    end
  end

  def ride_params
    params.require(:ride).permit(:time, :remaining_capacity, :to, :from)
  end
end
