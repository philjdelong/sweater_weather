class Forecast
    attr_reader :id

    def initialize(location)
        @location = location
        @id = 1
    end

    def currently
        ForecastService.new(@location).currently
    end

    def minutely
        ForecastService.new(@location).minutely
    end

    def hourly
        ForecastService.new(@location).hourly
    end

    def daily
        ForecastService.new(@location).daily
    end

    def alerts
        ForecastService.new(@location).alerts
    end
end