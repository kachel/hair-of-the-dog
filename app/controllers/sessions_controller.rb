class SessionsController < ApplicationController
  include SessionsHelper
  skip_before_action :require_email, only: :destroy

  def new
  end

  def create
    # omniauth log in
    if auth_hash = request.env["omniauth.auth"]
      user = User.find_or_create_by_omniauth(auth_hash)
      if user && user.email
        log_in user
        redirect_to user_path(user)
      elsif user
        # user.email will be nil
        flash[:notice] = "Welcome to Hair of the Dog. Enter your email! :D"
        log_in user
        redirect_to edit_user_path(user)
      else
        flash.now[:notice] = "Something went wrong with GitHub"
        render 'new'
      end
    else
      # old school log in
      user = User.find_or_create_by_email(params)
      if user
        log_in user
        redirect_to user_path(user)
      else
        flash.now[:notice] = "Something went wrong"
        render 'new'
      end
    end
  end

  def destroy
    log_out
    redirect_to signin_path
  end
end
