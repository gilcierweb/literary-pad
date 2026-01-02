class AddChaptersCountToStories < ActiveRecord::Migration[8.1]
  def change
    add_column :stories, :chapters_count, :integer, default: 0

    Story.find_each do |story|
      Story.reset_counters(story.id, :chapters)
    end
  end
end
