require 'rails_helper'

RSpec.describe "Forecast API" do
    describe "Endpoints" do
        before :each do
            @city = "denver,co"
        end

        it "gives the daily forecast for a given city" do
            get "/api/v1/forecast?location=#{@city}"
            expect(response).to be_successful
        end
    end
end