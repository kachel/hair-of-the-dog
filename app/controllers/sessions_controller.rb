class SessionsController < ApplicationController

  def new
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      user = User.find_or_create_by_omniauth(auth_hash)
      log_in(user)
      redirect_to root_url
    else
      # old school log in
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        log_in(user)
        redirect_to root_url
      else
        render signin_url
      end
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
