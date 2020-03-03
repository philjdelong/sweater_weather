class Api::V1::MunchiesController < ApplicationController

    def index
        munchie = Munchie.new(params)
        render json: MunchieSerializer.new(munchie)
    end
end