# frozen_string_literal: true

class AllRequestsController < ApplicationController
  before_action :authenticate_user!
  def index
    @vehicle_ids = []
    current_user.vehicles.each do |vehicle|
      @vehicle_ids << vehicle.id
    end
    @user_rides = Ride.where(vehicle_id: @vehicle_ids)
    @user_requests = Request.where(user_id: current_user.id)
  end

  def show
    @ride = Ride.find(params[:id])
    @requests = Request.where(ride_id: @ride.id)
  end
end
