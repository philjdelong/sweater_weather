require 'rails_helper'

RSpec.describe "Roadtrip" do
    describe "Endpoint" do
        it "shows 200 response with origin destination travel_time forecast " do

            post "/api/v1/users", params:{
                email: 'phil@example.com',
                password: 'password',
                password_confirmation: 'password'
            }

            phil = User.last

            post '/api/v1/road_trip', params: {
                origin: 'Denver, CO',
                destination: 'Pueblo, CO',
                api_key: phil.api_key
            }

            expect(response).to be_successful
            expect(response.status).to eq(200)

            get_json = JSON.parse(response.body)
            expect(get_json['data']['attributes'].keys).to eq(['start_location', 'end_location', 'travel_time', 'forecast'])
            expect(get_json['data']['attributes']['forecast'].keys).to eq(['summary', 'temperature'])
        end
    end
end