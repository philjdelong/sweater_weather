class AntipodeSerializer
    include FastJsonapi::ObjectSerializer
    attributes :location_name, :forecast
end