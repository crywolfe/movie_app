class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
			t.string :title
			t.integer :year
			t.integer :imdb_id
			t.text :plot
			t.timestamps
    end
  end
end
