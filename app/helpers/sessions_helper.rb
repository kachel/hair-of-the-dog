module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  # This method will be used to replace user-specific content in views with a
  # link to log in.
  # EX: Users cannot comment on recipes if they are logged in.
  #
  #   <%= if_logged_in? login_link_text: "Log in to comment" do %>
  #     <%= form_for(@comment) %> ...
  #   <% end %>
  #
  def if_logged_in?(login_link_text: "Log in to see more")
    if current_user
      yield
    else
      link_to login_link_text, signin_url
    end
  end

end # module SessionsHelper
