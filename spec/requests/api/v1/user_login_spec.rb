require 'rails_helper'

RSpec.describe "User Login" do
    describe "Endpoint" do
        it "shows 200 response and api_key with successful login" do
            post "/api/v1/users", params:{
            email: 'phil@example.com',
            password: 'password',
            password_confirmation: 'password'
        }

            phil = User.create(id: 1, email: 'phil@example.com', password_digest: 'abcdefg')

            post "/api/v1/sessions", params:{
                email: "#{phil.email}",
                password: "#{phil.password_digest}"
            }
            
            expect(response).to be_successful
            expect(response.status).to eq(200)

            get_json = JSON.parse(response.body)
            expect(get_json['data']['attributes'].keys).to eq(['api_key'])
        end

        it "gets 400 error if credentials are incorrect" do
            
            phil = User.create(id: 1, email: 'phil@example.com', password_digest: 'abcdefg')

            post "/api/v1/users", params:{
                email: 'phil@example.com',
                password: 'wrong',
            }
    
            expect(response.status).to eq(400)
        end
    end
end