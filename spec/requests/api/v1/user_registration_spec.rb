require 'rails_helper'

RSpec.describe "User Registration Endpoint" do
    it "creates a user with email, password, api_key" do
        post "/api/v1/users", params:{
            email: 'phil@example.com',
            password: 'password',
            password_confirmation: 'password'
        }

        phil = User.last
        expect(response).to be_successful
        expect(response.status).to eq(201)
        
        get_json = JSON.parse(response.body)

        expect(get_json['data']['attributes'].keys).to eq(['api_key'])
    end

    it "gets 400 error if passwords are not the same" do
        post "/api/v1/users", params:{
            email: 'phil@example.com',
            password: 'right',
            password_confirmation: 'wrong'
        }

        expect(response.status).to eq(400)
    end

    it "gets 400 error if email is in use" do
        phil = User.create(id: 1, email: 'phil@example.com', password_digest: 'abcdefg', api_key: '1')

        post "/api/v1/users", params:{
            email: 'phil@example.com',
            password: 'password',
            password_confirmation: 'password'
        }
        expect(response.status).to eq(400)
    end
end