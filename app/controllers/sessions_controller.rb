class SessionsController < ApplicationController

  def new
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      # they successfully logged in via oauth!
      oauth_email = request.env["omniauth.auth"]["info"]["email"]
      if user = User.find_by(email: oauth_email)
        log_in(user)
        redirect_to root_url
      else
        # validations
        user = User.create(email: oauth_email, password: SecureRandom.hex)
        log_in(user)

        redirect_to root_url
      end
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
