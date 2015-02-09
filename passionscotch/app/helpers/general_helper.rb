helpers do

  def current_user
    if session[:id]
      @user ||= User.find(session[:id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

end