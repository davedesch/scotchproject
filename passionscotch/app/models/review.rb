class Review < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :scotch


  validates :review, presence: true
  # validates :ranking, greater_than: 0, less_than_or_equal_to: 100
end
