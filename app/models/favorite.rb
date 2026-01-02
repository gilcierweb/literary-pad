# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  story_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_favorites_on_story_id  (story_id)
#  index_favorites_on_user_id   (user_id)
#

class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :story

  validates :user_id, uniqueness: { scope: :story_id }
end
