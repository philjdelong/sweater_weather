class Api::V1::RoadTripController < ApplicationController

    def create
        user = User.find_by(api_key: params[:api_key])
        if user
            road_trip = RoadTrip.new(road_trip_params)
            render json: RoadTripSerializer.new(road_trip)
        else
            render json: {error: "Not logged in"}, status: 401
        end
    end

    private

    def road_trip_params
        params.permit(:origin, :destination, :api_key)
    end
end