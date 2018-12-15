class RatingsController < ApplicationController
  def create
    #use session helper to add user_id
    rating = Rating.create(rating_params, id: current_user.id)

    redirect_to rating.post
  end

  private

    def rating_params
      params.require(:rating).permit(:star, :recipe_id)
    end
end
