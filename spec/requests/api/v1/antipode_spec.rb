require 'rails_helper'

RSpec.describe "Antipode endpoint" do
    it "sends id" do
        city = 'Hong Kong'

        get "/api/v1/antipode?location=#{city}"
        expect(response).to be_successful

        response = JSON.parse(response.body)

        expect(response['data']['attributes'].keys).to eq(['location_name', 'forecast'])
        expect(response['data']['attributes']['forecast'].keys).to eq(['summary', 'current_tempurature'])
    end
end


# http://amypode.herokuapp.com/api/v1/antipodes?lat=27&long=-82

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