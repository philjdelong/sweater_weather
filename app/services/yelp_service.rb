class YelpService

    def initialize(destination, food)
        @lat = destination.latitude
        @lng = destination.longitude
        @food = food
    end
    
    def restaurant_info
        {
            name: get_json['businesses'][0]['alias'],
            address: get_json['businesses'][0]['location']['address1']
        }
    end

    private

    def get_json
        JSON.parse(connection.get.body)
    end

    def connection
        return @conn if @conn
        @conn = Faraday.new("https://api.yelp.com/v3/businesses/search?term=#{@food}&latitude=#{@lat}&longitude=#{@lng}") do |f|
            f.adapter Faraday.default_adapter
            f.headers['Authorization'] = ENV['YELP_API_KEY']
        end
    end
end