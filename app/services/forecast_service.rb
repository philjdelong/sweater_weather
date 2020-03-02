class ForecastService

    def initialize(location)
        coordinates ||= GeoLocationService.new(location)
        @lat = coordinates.latitude
        @lng = coordinates.longitude
    end

    def data
        get_json
    end

    def currently
        data["currently"]
    end

    def minutely
        data["minutely"]
    end

    def hourly
        data["hourly"]
    end

    def daily
        data["daily"]
    end

    def alerts
        data["alerts"]
    end

    private

        def get_json
            JSON.parse(connection.get.body)
        end

        def connection
            key = ENV['DARK_SKY_KEY']

            return @conn if @conn
            @conn = Faraday.new(url: "https://api.darksky.net/forecast/#{key}/#{@lat},#{@lng}") do |f|
                f.adapter Faraday.default_adapter
            end
        end
end