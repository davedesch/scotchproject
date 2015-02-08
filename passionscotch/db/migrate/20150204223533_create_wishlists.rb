class CreateWishlists < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.integer :wisher_id
      t.integer :scotch_id
      t.text :comments

      t.timestamps
    end
  end
end
