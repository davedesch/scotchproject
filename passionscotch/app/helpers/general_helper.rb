helpers do

  def current_user
    if session[:user_id]
      @user ||= User.find(session[:user_id])
    end
  end

  def logged_in?
    current_user.nil? != false
  end

end