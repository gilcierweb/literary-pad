class CreateStoryGenres < ActiveRecord::Migration[8.1]
  def change
    create_table :story_genres do |t|
      t.references :story, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
