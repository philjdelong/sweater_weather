class RoadTrip
    attr_reader :id

    def initialize(trip_info)
        @id = nil
        @end_location = trip_info[:destination]
        @start_location = trip_info[:origin]
    end

    def start_location
        @start_location
    end

    def end_location
        @end_location
    end

    def travel_time
        GoogleDirectionsService.new(@start_location, @end_location).travel_time
    end

    def forecast
        current = Time.now.to_i
        travel = travel_time['value']
        arrival = (current + travel)
        
        x = ForecastService.new(@end_location, arrival)
        JSON.parse(x.future_forecast.body)['currently']
    end
end