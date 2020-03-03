class ForecastService

    def initialize(location)
        coordinates ||= GeoLocationService.new(location)
        @lat = coordinates.latitude
        @lng = coordinates.longitude
    end

    def currently
        x = get_json["currently"]
            {
                time: x["time"],
                summary: x["summary"],
                icon: x["icon"],
                temperature: x["temperature"],
                humidity: x["humidity"],
                visibility: x["visibility"],
                uv_index: x["uvIndex"],
                feels_like: x["apparentTemperature"]
            }
    end

    def hourly
        x = get_json['hourly']['data'][0..7].map do |hour|
            {
                time: hour["time"],
                temperature: hour["temperature"]
            }
        end
    end

    def daily
        x = get_json['daily']['data'][0..4].map do |day|
            {
                  summary: day['summary'],
                  icon: day['icon'],
                  precip_prob: day['precipProbability'],
                  precip_type: day['precipType'],
                  high_temp: day['temperatureHigh'],
                  low_temp: day['temperatureLow'],
                  day: Time.at(day['time'])
            }
        end
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