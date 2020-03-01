class GeoLocationService
    attr_accessor :address
    
    def initialize(address)
        @address = address
    end

    def coordinates
        get_json["results"][0]["geometry"]["location"]
    end

    def latitude
        coordinates["lat"]
    end

    def longitude
        coordinates["lng"]
    end

    private

    def get_json
        get_json = JSON.parse(connection.get.env['response_body'])
    end

    def connection
        key = ENV['GOOGLE_GEO_API']
    
        return @conn if @conn

        @conn = Faraday.new(url: "https://maps.googleapis.com/maps/api/geocode/json?") do |f|
            f.adapter Faraday.default_adapter
            f.params['key'] = key
            f.params['address'] = @address
        end
    end
end