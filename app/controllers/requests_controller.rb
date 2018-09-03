# frozen_string_literal: true

class RequestsController < ApplicationController
  before_action :authenticate_user!
  def index
    @ride = Ride.find(params[:ride_id])
    @driver = User.find_by(id: @ride.vehicle.user_id)
  end

  def show
    @request = Requests.find(params[:id])
  end

  def new
    @request = Requests.new
  end

  def edit
    @request = Requests.find(params[:id])
  end

  def update; end

  def create
    vehicle = Vehicle.find(params[:vehicle_id])
    request = vehicle.requests.build(ride_request_params)
    if request.save
      flash[:notice] = 'request made successfully!'
      redirect_to action: 'index'
    else
      flash[:error] = request.errors.messages
      render :new
    end
  end

  def destroy; end

  private

  def ride_request_params
    params.require(:request).permit(:pickup, :dropoff, :phone)
  end
end
