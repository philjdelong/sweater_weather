class Api::V1::SessionsController < ApplicationController

    def create
        user = User.find_by(email: params[:email])
        if user
            session[:user_id] = user.id
            render json: UserSerializer.new(user), status: 200
        else
            render json: {error: "Login not complete."}, status: 400
        end
    end
end