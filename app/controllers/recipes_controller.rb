class RecipesController < ApplicationController
    before_action :authorize
    # skip_before_action :authorize, only: [:create]

    def index
        recipes = Recipe.all 
        render json: recipes
    end

    def create
        user = find_user
        # user = User.find(session[:user_id])
        recipe = user.recipes.create!(recipe_params)
        render json: recipe, status: :created
    end


    private

    def authorize
       return render json: {errors: ["Not Authorized"]}, status: 401 unless session.include? :user_id
    end

    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete)
    end 
end
