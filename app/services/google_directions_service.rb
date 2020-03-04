class GoogleDirectionsService

    def initialize(startpoint, endpoint)
        @startpoint = startpoint
        @endpoint = endpoint
    end

    def travel_time
        get_json['routes'][0]['legs'][0]['duration']
    end

    private

    def get_json
        JSON.parse(connection.get.body)
    end

    def connection
        return @conn if @conn
        @conn = Faraday.new("https://maps.googleapis.com/maps/api/directions/json?origin=#{@startpoint}&destination=#{@endpoint}&key=#{ENV['GOOGLE_API_KEY']}") do |f|
            f.adapter Faraday.default_adapter
        end
    end
end