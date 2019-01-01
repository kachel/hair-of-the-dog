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

# check over validations / ingredients *need* join table
# Ingredient needs foreign id key for recipe

  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.save
      flash[:notice]  = "Recipe created!"
      redirect_to user_path current_user
    else
      flash[:error] = @recipe.errors.full_messages.to_sentence
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
    unless params[:new_ingredient].nil? || params[:new_ingredient].empty?
      ingredient = Ingredient.find_or_create_by(name: params[:new_ingredient])
      params[:recipe][:ingredient_ids] << ingredient.id.to_s
    end

    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      flash[:error] = @recipe.errors.full_messages.to_sentence
      render edit_recipe_path(@recipe)
    end
  end

  private

    def recipe_params
      # two things are not cooperating:
      # 1/ my validation constraints do not allow empty strings
      # my model should *not* have an exclusion, it is not its concern
      # 2/ building an ingredient name text field is empty by default
      # to deal with this, I sanitize the ingredients_attributes hash
      # *prior* to it being passed as a param

      # also `dig` is hash method for pulling data from nested hashes :3
      # it is a safe navigation operator
      if params.dig(:recipe, :ingredients_attributes, "0", :name) == ""
        params[:recipe][:ingredients_attributes] = {}
      end
      params.require(:recipe).permit(:user_id,
        :title, :servings, :time, :description,
        ingredients_attributes: [:id, :name],
        ingredient_ids: [],
        directions_attributes: [:id, :body]
      )
    end
end
