class BackgroundService

    def initialize(location)
        @location = location
    end

    def image_url
        x = get_json['results']
        {
            url: x[0]['urls']['raw']
        }
    end

    private

        def get_json
            JSON.parse(connection.get.body)
        end

        def connection
            return @conn if @conn
            @conn = Faraday.new("https://api.unsplash.com/search/photos?query=#{@location}&client_id=#{ENV['UNSPLASH_ACC_KEY']}")
        end
end