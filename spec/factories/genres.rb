# == Schema Information
#
# Table name: genres
#
#  id          :integer          not null, primary key
#  name        :string
#  slug        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :genre do
    name { "MyString" }
    slug { "MyString" }
    description { "MyText" }
  end
end
