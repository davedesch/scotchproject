enable :sessions

get '/' do
  redirect 'login'
end

get '/login' do
  erb :login
end


post '/register' do
  User.create(username: params[:username], email: params[:email], password: params[:password], name: params[:name])

  redirect '/login'
end

get '/reviews' do
  @scotch = Scotch.all
  @user = User.find(session[:user_id])
  erb :reviews
end

post '/login' do
  user = User.find_by(email: params[:email])
  if user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/#{user.username}"
  else
    erb :login
  end
end
post '/:id/add_review' do
  @user = User.find(session[:user_id])
  @drink = Scotch.find(params[:id])
  session[:scotch_id] = @drink.id
  erb :add_review
end

post '/add_review' do
  Review.create(scotch_id: session[:scotch_id], user_id: session[:user_id], ranking: params[:rating], review: params[:review])
  redirect '/'
end


get '/:user' do
  @user = User.find(session[:user_id])
  @reviews = Review.where(user_id: session[:user_id])
  erb :user
end

get '/:user/wishlist' do
  @user = User.find(session[:user_id])
  @wishlist = Wishlist.where(user_id: session[:user_id])
  erb :wishlist
end
