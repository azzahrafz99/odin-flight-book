class FlightsController < ApplicationController
  before_action :search, only: [:index]
  before_action :search_by_origin, only: [:index]
  before_action :search_by_departure, only: [:index]
  before_action :search_by_destination, only: [:index]
  def index
    @airports = Airport.all
    @date = departure_date
  end

  private

  def departure_date
    Flight.pluck(:departure_date).map do |date|
      date.to_formatted_s(:long)
    end.uniq
  end

  def search
    @results = Flight.all
  end

  def search_by_origin
    if params[:origin_id].present?
      @results = @results.where(origin_id: params[:origin_id])
    end
  end

  def search_by_destination
    if params[:destination_id].present?
      @results = @results.where(destination_id: params[:destination_id])
    end
  end

  def search_by_departure
    if params[:departure_date].present?
      @results = @results.where(departure_date: params[:departure_date])
    end
  end
end
