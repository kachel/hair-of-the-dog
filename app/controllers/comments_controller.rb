class CommentsController < ApplicationController
  def create
    #use session helper to add user_id
    comment = Comment.create(comment_params, id: current_user.id)
    redirect_to comment.post
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :recipe_id)
    end
end
