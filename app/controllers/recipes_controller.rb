class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find_by params[:id]
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
    @recipe.directions.build([
      {body: ''},
      {body: ''},
      {body: ''}])
    @placeholder_directions = ['Pour', 'Mix', 'Drink']
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render new_recipe_path
    end
  end

  private

    def recipe_params
      params.require(:recipe).permit(
        :title, :servings, :time, :description,
        ingredients_attributes: [:name],
        directions_attributes: [:body]
      )
    end
end
