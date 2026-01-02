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

require 'rails_helper'

RSpec.describe StoryGenre, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
