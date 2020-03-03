class AntipodeService

    def initialize(amypode)
        @amypode = amypode
    end

    def antipode_coords
        get_json['data']['attributes']
    end

    def antipode
        ReverseGeoService.new(antipode_coords).antipode_name
    end

    private

    def get_json
        JSON.parse(connection.get.body)
    end

    def amypode_location
        GeoLocationService.new(@amypode)
    end

    def connection
        return @conn if @conn
        @conn = Faraday.new("http://amypode.herokuapp.com/api/v1/antipodes?lat=#{amypode_location.latitude}&long=#{amypode_location.longitude}") do |f|
            f.headers['api_key'] = ENV['ANTIPODE_KEY']
        end
    end
end