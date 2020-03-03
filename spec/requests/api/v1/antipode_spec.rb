require 'rails_helper'

RSpec.describe "Antipode endpoint" do
    it "sends name and forecast" do
        city = 'Hong Kong'

        get "/api/v1/antipode?location=#{city}"
        expect(response).to be_successful

        antipode = JSON.parse(response.body)

        expect(antipode['data']['attributes'].keys).to eq(['location_name', 'forecast'])
        expect(antipode['data']['attributes']['location_name']).to eq("RP69, Jujuy, Argentina")
        expect(antipode['data']['attributes']['forecast'].keys).to eq(['summary', 'current_tempurature'])

        expect(antipode['data']['attributes']['forecast']['summary'].class).to eq(String)
        expect(antipode['data']['attributes']['forecast']['current_tempurature'].class).to eq(Float)
    end
end

# {
#     "data": [
#         {
#             "id": "1",
#             "type": "antipode",
#             "attributes": {
#                 "location_name": "Antipode City Name",
#                 "forecast": {
#                     "summary": "Mostly Cloudy,
#                     "current_temperature": "72",
#                                 },
#             "search_location": "Hong Kong"
#             }
#         }
#     ]
# }