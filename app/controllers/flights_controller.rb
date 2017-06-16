class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @date =  Flight.pluck(:departure_date).map(&:to_date)
    if params[:flights]
      if params[:flights][:origin_id].empty? && params[:flights][:destination_id].empty?
        @results = Flight.where(departure_date: params[:flights][:departure_date])
      elsif params[:flights][:departure_date].empty? && params[:flights][:destination_id].empty?
        @results = Flight.where(origin_id: params[:flights][:origin_id])
      elsif params[:flights][:departure_date].empty? && params[:flights][:origin_id].empty?
        @results = Flight.where(destination_id: params[:flights][:destination_id])
      elsif params[:flights][:origin_id].empty?
        @results = Flight.where(destination_id: params[:flights][:destination_id],
                                departure_date: params[:flights][:departure_date])
      elsif params[:flights][:destination_id].empty?
        @results = Flight.where(origin_id: params[:flights][:origin_id],
                                departure_date: params[:flights][:departure_date])
      elsif params[:flights][:departure_date].empty?
        @results = Flight.where(destination_id: params[:flights][:destination_id],
                                origin_id: params[:flights][:origin_id])
      else
        @results = Flight.where(destination_id: params[:flights][:destination_id],
                                origin_id: params[:flights][:origin_id],
                                departure_date: params[:flights][:departure_date])
      end
    end
  end
end
