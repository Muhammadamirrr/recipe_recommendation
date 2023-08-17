class RecipesController < ApplicationController
  def index
    @preferences = current_user.preference
    @recipes = SpoonacularService.fetch_recipes(@preferences, params[:query])

    respond_to do |format|
      format.html
      format.json { render json: @recipes }
    end
  end

  def show
    @recipe = SpoonacularService.fetch_recipe(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @recipe }
    end
  end
end
