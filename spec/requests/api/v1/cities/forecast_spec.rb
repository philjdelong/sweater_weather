require 'rails_helper'

RSpec.describe "Forecast API" do
    describe "Endpoints" do
        before :each do
            @city = "denver,co"
        end

        it "gives the current forecast for a given city" do
            get "/api/v1/forecast?location=#{@city}"
            expect(response).to be_successful

            forecast = JSON.parse(response.body)
            expect(forecast['data']['attributes']["currently"]["summary"].class).to eq(String)
        end
    end
end