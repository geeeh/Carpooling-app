# frozen_string_literal: true

class RequestsController < ApplicationController
  before_action :authenticate_user!, :check_account
  before_action :fetch_single_request, only: %i[destroy edit]
  before_action :fetch_ride, only: %i[index create destroy]

  def index
    @driver = User.find_by(id: @ride.vehicle.user_id)
  end

  def show; end

  def new
    @request = Requests.new
  end

  def edit; end

  def update; end

  def create
    @request = @ride.requests.new(request_params)
    @request.user_id = current_user.id
    if @request.save
      flash[:notice] = 'request made successfully!'
      @ride.decrement(:remaining_capacity)
      @ride.save
    else
      flash[:alert] = request.errors.messages
    end
    redirect_to action: 'index'
  end

  def destroy
    @ride = @request.ride
    if @request.delete
      flash[:notice] = 'Request canceled!'
      @ride.increment(:remaining_capacity)
      @ride.save
      redirect_to vehicle_ride_requests_path
    else
      flash[:error] = 'Failed to cancel this request!'
      render :index
    end
  end

  private

  def request_params
    params.require(:request).permit(:pickup, :dropoff)
  end

  def fetch_single_request
    @request = Request.find(params[:id])
  end

  def fetch_ride
    @ride = Ride.find(params[:ride_id])
  end

  def notify_user(number)
    Nexmo::Client.sms.send(
      from: 'Carpooling App',
      to: number,
      text: 'A text message sent using the Nexmo SMS API'
    )
  end
end
