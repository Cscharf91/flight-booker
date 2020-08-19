class FlightsController < ApplicationController
    def index
        @airport_options = Airport.all.map { |u| [ u.code, u.id ]}
        @dates = Flight.valid_dates

        if params[:commit]
            puts "*" * 100
            puts params[:commit]
            puts search_flights
        end
    end

    private

    def search_flights
        puts "making it to the search flights method"
        @flights = Flight.where(origin_id: params[:origin], destination_id: params[:destination], start: (params[:startdate].to_datetime.beginning_of_day..params[:startdate].to_datetime.end_of_day))
    end
end