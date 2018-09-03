# frozen_string_literal: true

# Ride controller class
# This is the controller responsible on all Ride actions.
class RidesController < ApplicationController
  before_action :authenticate_user!
  def index
    @vehicle_id = params[:vehicle_id]
    @rides = Ride.where(vehicle_id: @vehicle_id)
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
    @vehicle = Vehicle.find(params[:vehicle_id])
    @ride = @vehicle.rides.build(ride_params)
    if @ride.save!
      flash[:notice] = 'ride added!'
    else
      flash[:alert] = @ride.errors.messages
    end
    redirect_to action: 'index'
  end

  def update
    ride = Ride.find(params[:id])
    if ride.update_attributes(ride_params)
      flash[:notice] = 'ride updated!'
      redirect_to action: 'index'
    else
      flash[:alert] = 'Failed to edit ride!'
      render :edit
    end
  end

  def destroy
    ride = Ride.find(params[:id])
    requests = ride.requests
    if ride.destroy
      flash[:notice] = 'Ride canceled!'
      requests.each do |request|
        notify_requester(request.user.account.phone_number)
      end
    else
      flash[:alert] = 'Failed to delete this vehicles!'
    end
    redirect_to action: 'index'
  end

  def ride_params
    params.require(:ride).permit(:time, :remaining_capacity, :destination, :origin)
  end

  def notify_requester(number)
    nexmo = Nexmo::Client.new
    nexmo.sms.send(
      from: 'Carpooling App',
      to: number,
      text: 'Your ride has been canceled please visit carpooling app to book another.'
    )
  end
end
