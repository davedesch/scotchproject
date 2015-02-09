require 'bcrypt'

class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :reviews
  has_many :wishlist



  include BCrypt

  validates :email, presence: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def create
    @user = User.new(params[:user])
    @user.password = params[:password]
    @user.save!
  end

  def login
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      give_token
    end
  end

  def authenticate(password)
    self.password == password
  end



end
