enable :sessions

get '/' do
  erb :index
end

get '/login' do
  erb :login
end

get '/reviews' do
  @scotch = Scotch.first

  erb :reviews
end

post '/register' do
  User.create(username: params[:username], email: params[:email], password: params[:password], name: params[:name])

  redirect '/login'
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