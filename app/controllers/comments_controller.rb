class CommentsController < ApplicationController
  def create
    @comment = Comment.create(content: params[:comment][:content],
      recipe_id: params[:recipe_id],
      user_id: params[:comment][:user_id])
    redirect_to recipe_path(params[:recipe_id])
  end

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @user = @recipe.user.email
  end
end
