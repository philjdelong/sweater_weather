class ReverseGeoService
    
    def initialize(coords)
        @lat = coords['lat']
        @lng = coords['long']
    end

    def antipode_name
        get_json['results'][0]['formatted_address']
    end

    private
        def get_json
            JSON.parse(connection.get.body)
        end

        def connection
            key = ENV['GOOGLE_API_KEY']

            return @conn if @conn
            @conn = Faraday.new("https://maps.googleapis.com/maps/api/geocode/json?latlng=#{@lat},#{@lng}&key=#{key}") do |f|
                f.adapter Faraday.default_adapter
            end
        end
end