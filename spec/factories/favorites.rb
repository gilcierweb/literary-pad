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

FactoryBot.define do
  factory :favorite do
    user { nil }
    story { nil }
  end
end
