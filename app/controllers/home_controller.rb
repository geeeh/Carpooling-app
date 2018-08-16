# frozen_string_literal: true

# HomeController class is responsible for all Home actions.
class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @rides = Ride.all
  end

  def show
    @rides = Ride.find(params[:id])
  end

  def search
    @rides = Ride.where(from: params[:from], to: params[:to])
    redirect_to root_path
  end
end
