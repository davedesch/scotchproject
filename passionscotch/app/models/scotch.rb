class Scotch < ActiveRecord::Base
  # Remember to create a migration!
  has_many :reviews
  has_many :wishlists

end
