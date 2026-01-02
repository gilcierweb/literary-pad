class CreateProfiles < ActiveRecord::Migration[8.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :pen_name
      t.text :bio
      t.string :avatar
      t.string :location
      t.string :website
      t.jsonb :social_links
      t.integer :followers_count
      t.integer :following_count
      t.integer :stories_count

      t.timestamps
    end
  end
end
