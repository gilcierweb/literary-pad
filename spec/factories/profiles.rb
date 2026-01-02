# == Schema Information
#
# Table name: profiles
#
#  id              :integer          not null, primary key
#  user_id         :integer          not null
#  pen_name        :string
#  bio             :text
#  avatar          :string
#  location        :string
#  website         :string
#  social_links    :jsonb
#  followers_count :integer
#  following_count :integer
#  stories_count   :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#

FactoryBot.define do
  factory :profile do
    user { nil }
    pen_name { "MyString" }
    bio { "MyText" }
    avatar { "MyString" }
    location { "MyString" }
    website { "MyString" }
    social_links { "" }
    followers_count { 1 }
    following_count { 1 }
    stories_count { 1 }
  end
end
