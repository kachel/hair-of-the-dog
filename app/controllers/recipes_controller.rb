
class RecipesController < ApplicationController

  PLACEHOLDER_DIRECTIONS = ['Pour', 'Mix', 'Drink']

  def show

    @recipe = Recipe.find_by(id: params[:id])
    @comment = @recipe.comments.build

    # gets rid of nil comments
    @valid_comments = @recipe.comments.select { |c| c.user }
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
    @recipe.directions.build([
      {body: ''},
      {body: ''},
      {body: ''}])
    @pds = PLACEHOLDER_DIRECTIONS
  end

  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.save
      redirect_to user_path current_user
    else
      @pds = PLACEHOLDER_DIRECTIONS
      render new_recipe_path
    end
  end

  private

    def recipe_params
      params.require(:recipe).permit(:user_id,
        :title, :servings, :time, :description,
        ingredients_attributes: [:name],
        ingredient_ids: [],
        directions_attributes: [:body]
      )
    end
end
