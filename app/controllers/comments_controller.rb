class CommentsController < ApplicationController
  def create
    comment = Comment.create(content: params[:comment][:content], recipe_id: params[:recipe_id],
    user_id: params[:comment][:user_id])
    # put flash message here
    redirect_to recipe_path(params[:recipe_id])
    end
end
