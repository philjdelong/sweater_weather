require 'rails_helper'

RSpec.describe "Forecast API" do
    describe "Endpoints" do
        before :each do
            @city = "denver,co"
            get "/api/v1/forecast?location=#{@city}"
        end

        it "gives the current forecast for a given city" do
            expect(response).to be_successful

            forecast = JSON.parse(response.body)
            expect(forecast['data']['attributes']["currently"].keys).to eq(['time', 'summary', 'icon', 'temperature', 'humidity', 'visibility', 'uv_index', 'feels_like'])
        end

        it "gives the hourly forecast for a given city" do
            forecast = JSON.parse(response.body)
            expect(forecast['data']['attributes']["hourly"][0].keys).to eq(['time', 'temperature'])
        end


        it "gives the daily forecast for a given city" do
            forecast = JSON.parse(response.body)
            expect(forecast['data']['attributes']["daily"][0].keys).to eq(['summary', 'icon', 'precip_prob', 'precip_type', 'high_temp', 'low_temp', 'day'])
        end
    end
end