class Antipode
    attr_reader :id

    def initialize(amypode)
        @id = nil
        @amypode = amypode
    end

    def location_name
        AntipodeService.new(@amypode).antipode
    end

    def forecast
        data = ForecastService.new(location_name)
        {
            summary: data.currently[:summary],
            current_tempurature: data.currently[:temperature]
        }
    end
end