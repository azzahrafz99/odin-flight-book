class BookingsController < ApplicationController
  def index
  end

  def show
    @booking = Booking.find(params[:id])
    @passenger = Passenger.find(params[:id])
  end

  def new
    @flights_pick = Flight.find_by_id(params[:bookings][:flight_id])
    @booking = @flights_pick.bookings.build
    @seats = params[:seats].to_i
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      @passenger = @booking.passengers.build
      @passenger = Passenger.new(
        first_name: params[:bookings][:passengers][:first_name],
        last_name: params[:bookings][:passengers][:last_name],
        email: params[:bookings][:passengers][:email],
        booking_id: @booking.id,
        flight_id: params[:bookings][:passengers][:flight_id]
      )
      @passenger.save
      redirect_to @booking
    else
      redirect_to flights_path
    end
    binding.pry
  end

  private
    def booking_params
      params.require(:bookings).permit(:flight_id, :passengers_attributes =>
                                      [:id, :first_name, :last_name, :email, :booking_id, :flight_id])
    end
end
