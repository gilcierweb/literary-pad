# == Schema Information
#
# Table name: story_genres
#
#  id         :integer          not null, primary key
#  story_id   :integer          not null
#  genre_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_story_genres_on_genre_id  (genre_id)
#  index_story_genres_on_story_id  (story_id)
#

class StoryGenre < ApplicationRecord
  belongs_to :story
  belongs_to :genre
end
