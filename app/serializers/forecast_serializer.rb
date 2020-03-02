class ForecastSerializer
    include FastJsonapi::ObjectSerializer
    attributes :currently, :minutely, :hourly, :daily, :alerts
end