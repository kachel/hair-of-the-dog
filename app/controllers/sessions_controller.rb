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
      user = User.find_by(email: params[:user][:email])
      if user && user.authenticate(params[:user][:password])
        log_in(user)
        redirect_to root_url
      else
        render signin_path, notice: "UwU something went wrong"
      end
    end
  end

  def destroy
    log_out
    redirect_to signin_path
  end
end
