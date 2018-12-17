class RecipesController < ApplicationController

  PLACEHOLDER_DIRECTIONS = ['Pour', 'Mix', 'Drink']

  def show
    @recipe = Recipe.find_by(id: params[:id])
    @comment = @recipe.comments.build
    @rating = Rating.find_by(recipe_id: @recipe.id, user_id: current_user.id) || @recipe.ratings.build

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

  def edit
    @recipe = Recipe.find_by(id: params[:id])
    @pds = PLACEHOLDER_DIRECTIONS
  end

  def update
    @recipe = Recipe.find(params[:id])
    unless params[:new_ingredient].nil?
      ingredient = Ingredient.find_or_create_by(name: params[:new_ingredient])
      params[:recipe][:ingredient_ids] << ingredient.id.to_s
    end

    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render edit_recipe_path
    end
  end

  private

    def recipe_params
      params.require(:recipe).permit(:user_id,
        :title, :servings, :time, :description,
        ingredients_attributes: [:id, :name],
        ingredient_ids: [],
        directions_attributes: [:id, :body]
      )
    end
end
