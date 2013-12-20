module ApplicationHelper
  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def login!(user)
    user.reset_session_token
    user.save!
    session[:session_token] = user.session_token
  end

  def logout!
    current_user.reset_session_token
    current_user.save!
    session[:session_token] = nil
  end

end
