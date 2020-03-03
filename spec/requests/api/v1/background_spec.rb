require 'rails_helper'

RSpec.describe "Background Image" do
    describe "Endpoint" do
        it "lists an image from location parameter" do
            location = "denver,co"

            get "/api/v1/backgrounds?location=#{location}"
            expect(response).to be_successful

            background = JSON.parse(response.body)
            expect(background['data']['attributes']['image'].count).to eq(1)
        end
    end
end