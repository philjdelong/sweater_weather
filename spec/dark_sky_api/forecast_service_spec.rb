require 'rails_helper'

RSpec.describe "ForecastService" do
    describe "gives the forecast data for a given city" do
        before :each do
            location = "denver"
            @forecast = Forecast.new(location)
        end

        it "including current weather" do
            # expect(@forecast.currently["summary"]).to eq("Mostly Cloudy")
            # expect(@forecast.currently["teperature"]).to eq(37.13)
            expect(@forecast.currently["summary"].class).to eq(String)
            expect(@forecast.currently["temperature"].class).to eq(Float)
        end

        it "including minutely weather" do
            # expect(@forecast.minutely["summary"]).to eq("Light snow starting in 2 min.")
            expect(@forecast.minutely["summary"].class).to eq(String)
        end

        it "including hourly weather" do
            # expect(@forecast.hourly["summary"]).to eq("Clear throughout the day.")
            # expect(@forecast.hourly['data'][0]['precipProbability']).to eq(0.96)
            expect(@forecast.hourly["summary"].class).to eq(String)
            expect(@forecast.hourly['data'][0]['precipProbability'].class).to eq(Integer)
        end

        it "including daily weather" do
            # expect(@forecast.daily["summary"]).to eq("Possible light snow today.")
            # expect(@forecast.daily['data'][0]['temperatureHigh']).to eq(42.59)
            expect(@forecast.daily["summary"].class).to eq(String)
            expect(@forecast.daily['data'][0]['temperatureHigh'].class).to eq(Float)
        end

        it "including weather alerts" do
            # expect(@forecast.alerts[0]["title"]).to eq("Winter Weather Advisory")
            expect(@forecast.alerts[0]["title"].class).to eq(String)
        end
    end
end