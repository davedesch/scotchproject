class Review < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :rater_id, class_name: 'User'
  belongs_to :scotch_id, class_name: "Scotch"

end
