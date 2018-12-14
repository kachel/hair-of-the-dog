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
        :title,
        ingredients_attributes: [:unit, :name, :qty],
        directions_attributes: [:step_1, :step_2, :step_3,:step_4,:step_5]
      )
    end
end
