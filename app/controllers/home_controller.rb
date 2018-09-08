# frozen_string_literal: true

# HomeController class is responsible for all Home actions.
class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :check_account

  def index
    @rides = Ride.available_rides
  end

  def show
    @rides = Ride.find(params[:id])
  end

  def search
    @rides = Ride.search(search_params)
    render :index
  end

  private

  def search_params
    params.require(:search).permit(:origin, :destination)
  end
end
