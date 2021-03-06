class BookingsController < ApplicationController
  def index; end

  def show
    @booking = Booking.find(params[:id])
    @passengers = @booking.passengers
  end

  def new
    @flight = Flight.find_by_id(params[:booking,][:flight_id])
    @seats = params[:booking][:seats].to_i
    @booking = @flight.bookings.build
    @seats.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      @booking.passengers.each do |p|
        PassengerMailer.welcome_email(p).deliver_now
      end
      redirect_to @booking
    else
      redirect_to flights_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, :seats,
                                    passengers_attributes: [:id, :first_name,
                                                            :last_name,
                                                            :email, :booking_id,
                                                            :flight_id])
  end
end
