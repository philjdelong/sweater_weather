class Api::V1::AntipodeController < ApplicationController

    def index
        amypode = params['location']
        
        antipode = Antipode.new(amypode)
        render json: AntipodeSerializer.new(antipode)
    end
end