class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :require_email

  private

    def require_email
      # this find method is slow :(
      user = current_user
      if user && !user.email
        flash[:notice] = "Welcome GitHub user. We need your email to continue."
        redirect_to edit_user_path(user)
      end
    end
end
