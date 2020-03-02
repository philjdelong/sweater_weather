class Api::V1::ForecastController < ApplicationController

    def index
        info = Forecast.new(params["location"])
        render json: ForecastSerializer.new(info)
    end
end