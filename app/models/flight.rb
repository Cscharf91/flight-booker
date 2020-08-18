class Flight < ApplicationRecord
    belongs_to :origin, class_name: 'Airport'
    belongs_to :destination, class_name: 'Airport'

    def self.valid_dates
        flights = Flight.all.order(start: :asc)
        flights.sort_by { |f| f.start}
        flights.map { |f| f.start.strftime('%b %d, %Y') }.uniq
    end

    private

    def self.search_flights(origin, destination, start)
        where(origin_id: origin, destination_id: destination,
              start: Flight.parse_date(start))
      end

    def self.parse_date(date)
        datetime = date.to_datetime
        puts datetime.beginning_of_day..datetime.end_of_day
    end
end
