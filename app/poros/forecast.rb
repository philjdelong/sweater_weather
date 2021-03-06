class Forecast
    attr_reader :id

    def initialize(location)
        @location = location
        @id = nil
    end

    def currently
        ForecastService.new(@location).currently
    end

    def hourly
        ForecastService.new(@location).hourly
    end

    def daily
        ForecastService.new(@location).daily
    end
end