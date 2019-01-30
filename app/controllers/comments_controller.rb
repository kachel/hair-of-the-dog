class CommentsController < ApplicationController
  def create
    @comment = Comment.create(content: params[:comment][:content],
      recipe_id: params[:recipe_id],
      user_id: params[:comment][:user_id])
    render json: @comment, status: 201
  end

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @user = @recipe.user.email
    @comments = @recipe.comments
    # render layout: false
    render json: @comments
  end
end
