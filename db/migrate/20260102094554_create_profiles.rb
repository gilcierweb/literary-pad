class CreateProfiles < ActiveRecord::Migration[8.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :pen_name
      t.text :bio
      t.string :avatar
      t.string :location
      t.string :website
      t.jsonb :social_links, default: {}
      t.integer :followers_count, default: 0
      t.integer :following_count, default: 0
      t.integer :stories_count, default: 0

      t.timestamps
    end

    add_index :profiles, :user_id, unique: true
  end
end
