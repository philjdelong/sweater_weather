class Background
    attr_reader :id

    def initialize(location)
        @id = nil
        @location = location
    end

    def image
        BackgroundService.new(@location).image_url
    end
end