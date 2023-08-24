class UsersController < ApplicationController
    before_action :authorize
    skip_before_action :authorize, only: [:create]

    def create
        user = User.create!(user_params)
        session[:user_id] = user.id 
        render json: user, status: :created
    end

    def show
        user = find_user
        # user = User.find(session[:user_id])
        render json: user
    end

    private

    def authorize
        return render json: {error: "Not authorized"}, status: 401 unless session.include? :user_id
    end

    def user_params
        params.permit(:username, :password, :password_confirmation, :bio, :image_url)
    end 
end
