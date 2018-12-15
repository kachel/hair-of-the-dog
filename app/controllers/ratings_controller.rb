class RatingsController < ApplicationController
  def create
    rating = Rating.create(star: params[:rating][:star], recipe_id: params[:recipe_id],
    user_id: current_user.id)
    # put flash message here
    redirect_to recipe_path(params[:recipe_id])
  end

  def update
    rating = Rating.find(params[:id])
    rating.update(star: params[:rating][:star])
    # put flash message here
    redirect_to recipe_path(params[:recipe_id])
  end
end
