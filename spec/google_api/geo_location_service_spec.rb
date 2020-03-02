require 'rails_helper'

RSpec.describe "GeoLocationService" do
    it "gives the latitude and longitude for a given city" do
        address = "denver,co"
        
        coordinates = GeoLocationService.new(address)
        
        geo_lat = coordinates.latitude
        geo_lng = coordinates.longitude

        expect(geo_lat).to eq(39.7392358)
        expect(geo_lng).to eq(-104.990251)
    end
end