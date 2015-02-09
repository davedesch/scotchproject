helpers do

  def session_logged_in?
    !session_current_user.nil?
  end

  def session_current_user_id user
    session[:user_id] = user.id
  end

  def session_set_current_user user
    session[:user_id] = user.id
    @current_user = user
  end