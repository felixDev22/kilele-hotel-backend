class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      render json: @booking, status: :created
    else
      render json: @booking.errors, status: :unprocessable_entity 
    end
  end

  def index
    @bookings = Booking.all
    render json: @bookings
  end

  def show
    @booking = Booking.find(params[:id])
    render json: @bookings
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :date_of_arrival, :date_of_departure, :adults, :children, :room, :total_price)
  end
end
