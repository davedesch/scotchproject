class Review < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :scotch


  validates :review, presence: true
end
