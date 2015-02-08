class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :scotch_id
      t.integer :user_id
      t.integer :ranking
      t.text :review


      t.timestamps
    end
  end
end
