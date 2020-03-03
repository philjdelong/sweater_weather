class Munchie
    attr_reader :id

    def initialize(munchie_info)
        @id = nil
        @end_location = munchie_info[:end]
        @start_location = munchie_info[:start]
        @food = munchie_info[:food]

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
        JSON.parse(x.future_forecast.body)['currently']['summary']
    end

    def restaurant
        x = YelpService.new(GeoLocationService.new(@end_location), @food).restaurant_info
    end
end