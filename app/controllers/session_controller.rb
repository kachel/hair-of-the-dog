class SessionController < ApplicationController

  def new
  end

  def create
    # raise "stop".inspect
    # user = User.find_by(email: params[:email])
    # if user && user.authenticate(params[:password])
      # session[:user_id] = user_id # login helper?
    # end
  end

  def destroy
    #redirect_to login_path
  end
end
