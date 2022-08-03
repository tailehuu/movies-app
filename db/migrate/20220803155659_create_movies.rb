class CreateMovies < ActiveRecord::Migration
  def up
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.string :link
      t.integer :number_votes_up, default: 0
      t.integer :number_votes_down, default: 0
      t.integer :user_id

      t.timestamps
    end

    add_index :movies, :user_id
  end

  def down
    drop_table :movies
  end
end
