class RecipesController < ApplicationController

  PLACEHOLDER_DIRECTIONS = ['Pour', 'Mix', 'Drink']

  def show
    @recipe = Recipe.find_by params[:id]
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
      @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      binding.pry
      @pds = PLACEHOLDER_DIRECTIONS
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
