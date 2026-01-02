# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  user_id          :integer          not null
#  commentable_type :string           not null
#  commentable_id   :integer          not null
#  content          :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_comments_on_commentable  (commentable_type,commentable_id)
#  index_comments_on_user_id      (user_id)
#

FactoryBot.define do
  factory :comment do
    user { nil }
    commentable { nil }
    content { "MyText" }
  end
end
