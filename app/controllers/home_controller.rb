# frozen_string_literal: true

require 'date'

# HomeController class is responsible for all Home actions.
class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    date = Time.now
    @vehicle_id =
      @rides = Ride.where('time > ?', date).where('remaining_capacity >?', 0)
    redirect_to account_index_path if current_user.account.nil?
  end

  def show
    @rides = Ride.find(params[:id])
  end

  def search
    @rides = Ride.where('lower(origin) like lower(?) OR lower(destination) like lower(?)',
                        search_params[:origin], search_params[:destination])
    render :index
  end

  private

  def search_params
    params.require(:search).permit(:origin, :destination)
  end
end
