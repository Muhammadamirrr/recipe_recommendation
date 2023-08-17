class RecipesController < ApplicationController
  def index
<<<<<<< Updated upstream
    @recipes = SpoonacularService.fetch_recipes(params[:query])
=======
    @preferences = current_user.preference
    @recipes = SpoonacularService.fetch_recipes(@preferences, params[:query])

    respond_to do |format|
      format.html
      format.json { render json: @recipes }
    end
>>>>>>> Stashed changes
  end

  def show
    @recipe = SpoonacularService.fetch_recipe(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @recipe }
    end
  end
end
