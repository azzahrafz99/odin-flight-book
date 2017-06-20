class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @date = departure_date
    @results = Flight.all

    if params[:origin_id].present?
      @results = @results.where(origin_id: params[:origin_id])
    end

    if params[:departure_date].present?
      @results = @results.where(departure_date: params[:departure_date])
    end

    if params[:destination_id].present?
      @results = @results.where(destination_id: params[:destination_id])
    end
  end

  private

  def departure_date
    Flight.pluck(:departure_date).map do |date|
      date.to_formatted_s(:long)
    end.uniq
  end
end
