# == Schema Information
#
# Table name: likes
#
#  id            :integer          not null, primary key
#  user_id       :integer          not null
#  likeable_type :string           not null
#  likeable_id   :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_likes_on_likeable  (likeable_type,likeable_id)
#  index_likes_on_user_id   (user_id)
#

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true, counter_cache: :likes_count

  validates :user_id, uniqueness: { scope: [:likeable_type, :likeable_id] }
end
