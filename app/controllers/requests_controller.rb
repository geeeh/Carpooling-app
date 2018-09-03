# frozen_string_literal: true

class RequestsController < ApplicationController
  before_action :authenticate_user!
  def index
    @ride = Ride.find(params[:ride_id])
    @driver = User.find_by(id: @ride.vehicle.user_id)
  end

  def show; end

  def new
    @request = Requests.new
  end

  def edit
    @request = Requests.find(params[:id])
  end

  def update; end

  def create
    ride = Ride.find(params[:ride_id])
    request = ride.requests.build(request_params)
    request.user_id = current_user.id
    if request.save
      flash[:notice] = 'request made successfully!'
      ride.remaining_capacity -= 1
      ride.save
      redirect_to action: 'index'
    else
      flash[:error] = request.errors.messages
      render :new
    end
  end

  def destroy
    @request = Request.find(params[:id])
    @ride = @request.ride
    if @request.delete
      flash[:notice] = 'Request canceled!'
      @ride.remaining_capacity += 1
      @ride.save
      redirect_to vehicle_ride_requests_path
    else
      flash[:error] = 'Failed to cancel this request!'
      render :destroy
    end
  end

  private

  def request_params
    params.require(:request).permit(:pickup, :dropoff)
  end

  def notify_user(number)
    Nexmo::Client.sms.send(
      from: 'Carpooling App',
      to: number,
      text: 'A text message sent using the Nexmo SMS API'
    )
  end
end
