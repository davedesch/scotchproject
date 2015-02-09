enable :sessions

get '/' do
  redirect 'login'
end

get '/login' do
  erb :login
end


post '/login' do
  user = User.find_by(email: params[:email])
  if user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/#{user.username}"
  else
    @login_error = "Sorry, that didn't work. Please try again."
    erb :login
  end
end

post '/register' do
  new_user = User.create(username: params[:username], email: params[:email], password: params[:password], name: params[:name])


  erb :login
end

get '/reviews' do
  @user = User.find(session[:user_id])
  @scotch = Scotch.all
  erb :reviews
end




get '/logout' do
  logout_user = session[:user_id]
  session[:user_id] = nil
  redirect '/login'
end

post '/:id/add_review' do
  @user = User.find(session[:user_id])
  @scotch = Scotch.find(params[:id])
  session[:scotch_id] = @scotch.id
  erb :add_review
end

get '/:review_id/edit_review' do
  @review = Review.find(params[:review_id])
  session[:review_id] = @review.id
  @user = User.find(session[:user_id])
  erb :edit_delete_review
end

post '/edit_review' do
  user = User.find(session[:user_id])
  review = Review.find(session[:review_id])
  review.update(ranking: params[:rating], review: params[:review])
  redirect "/#{user.username}"
end

post '/:id/view_reviews' do
  @scotch = Scotch.find(params[:id])
  session[:scotch_id] = @scotch.id
  @review = Review.where(scotch_id: session[:scotch_id])
  erb :view_reviews
end

post '/add_review' do
  user = User.find(session[:user_id])
  @new_review = Review.create(scotch_id: session[:scotch_id], user_id: session[:user_id], ranking: params[:rating], review: params[:review])
  scotch = Scotch.find_by(id: session[:scotch_id])
  if @new_review.valid?
  redirect "/#{user.username}"
  else
  @errors = @new_review.errors[:review][0]
  redirect "/#{scotch.id}/add_review"
  erb :add_review
  end
end


get '/:user' do
  @user = User.find(session[:user_id])
  @reviews = Review.where(user_id: session[:user_id])
  erb :user
end

post '/:scotch_id/add_to_wishlist' do
  scotch = Scotch.find(params[:scotch_id])
  user = User.find(session[:user_id])
  Wishlist.create(scotch_id: scotch.id, user_id: session[:user_id],comments: params[:comment] )
  redirect "/#{user.username}/wishlist"
end


get '/:user/wishlist' do
  @user = User.find(session[:user_id])
  @wishlist = Wishlist.where(user_id: session[:user_id])
  erb :wishlist
end

post '/delete_review' do
  user = User.find(session[:user_id])
  review = Review.find(session[:review_id])
  review.destroy
  redirect "/#{user.username}"
end
