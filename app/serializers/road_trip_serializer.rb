class RoadTripSerializer
    include FastJsonapi::ObjectSerializer
    attributes :start_location, :end_location, :travel_time, :forecast
end