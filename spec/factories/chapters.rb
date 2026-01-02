# == Schema Information
#
# Table name: chapters
#
#  id           :integer          not null, primary key
#  story_id     :integer          not null
#  title        :string
#  content      :text
#  position     :integer
#  published_at :datetime
#  views_count  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_chapters_on_story_id  (story_id)
#

FactoryBot.define do
  factory :chapter do
    story { nil }
    title { "MyString" }
    content { "MyText" }
    position { 1 }
    published_at { "2026-01-02 06:48:49" }
    views_count { 1 }
  end
end
