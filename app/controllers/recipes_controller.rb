class RecipesController < ApplicationController
  def show
    
  end

  def new
    @recipe = Recipe.new
    @recipe.directions.build
    @recipe.ingredients.build
  end

  private

    def recipe_params
      params.require(:recipe).permit(
        :title, :servings, :time, :description,
        ingredients_attributes: [:name],
        directions_attributes: [:step_1, :step_2, :step_3]
      )
    end
end
