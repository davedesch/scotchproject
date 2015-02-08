class Wishlist < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user, :foreign_key => 'wisher_id'

end
