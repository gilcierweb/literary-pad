class CreateChapters < ActiveRecord::Migration[8.1]
  def change
    create_table :chapters do |t|
      t.references :story, null: false, foreign_key: true
      t.string :title
      t.text :content
      t.integer :position
      t.datetime :published_at
      t.integer :views_count, default: 0

      t.timestamps
    end

    add_index :chapters, [:story_id, :position]
  end
end
