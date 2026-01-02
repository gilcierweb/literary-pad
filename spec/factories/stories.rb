# == Schema Information
#
# Table name: stories
#
#  id             :integer          not null, primary key
#  user_id        :integer          not null
#  title          :string
#  description    :text
#  cover_image    :string
#  status         :integer
#  views_count    :integer
#  likes_count    :integer
#  comments_count :integer
#  published_at   :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_stories_on_user_id  (user_id)
#

FactoryBot.define do
  factory :story do
    user { nil }
    title { "MyString" }
    description { "MyText" }
    cover_image { "MyString" }
    status { 1 }
    views_count { 1 }
    likes_count { 1 }
    comments_count { 1 }
    published_at { "2026-01-02 06:48:34" }
  end
end
