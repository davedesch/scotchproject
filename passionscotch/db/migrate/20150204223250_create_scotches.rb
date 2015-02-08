class CreateScotches < ActiveRecord::Migration
  def change
    create_table :scotches do |t|
      t.string :distillery
      t.string :bottling_name
      t.integer :age
      t.string :region
      t.text :tasting_notes
      t.string :website
      t.integer :abv
      t.string :img_url

      t.timestamps
    end
  end
end
