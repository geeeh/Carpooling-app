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
end
