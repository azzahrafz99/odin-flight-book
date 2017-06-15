class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end
  def new
    if params[:bookings]
      @flights_pick = Flight.find(params[:bookings][:flight_id])
      @booking = @flights_pick.bookings.build
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:success] = 'Booking successful!'
      redirect_to @booking
    else
      flash[:danger] = 'Booking failed!'
      redirect_to flights_path
    end
  end

  def booking_params
    params.require(:bookings).permit(:flight_id, passengers:
                                    [:id, :first_name, :last_name, :email])
  end
end
