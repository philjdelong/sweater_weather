require 'rails_helper'

RSpec.describe "ForecastService" do
    describe "gives the forecast data for a given city" do
        before :each do
            location = "denver,co"
            @forecast = Forecast.new(location)
        end

        it "including current weather" do
            expect(@forecast.currently[:summary].class).to eq(String)
            expect(@forecast.currently[:temperature].class).to eq(Float)
        end

        it "including hourly weather" do
            expect(@forecast.hourly.count).to eq(8)
        end

        it "including daily weather" do
            expect(@forecast.daily.count).to eq(5)
        end
    end
end