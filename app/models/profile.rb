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

class Profile < ApplicationRecord
  belongs_to :user

  validates :pen_name, length: { maximum: 100 }
  validates :bio, length: { maximum: 500 }
  # validates :website, url: true, allow_blank: true

  def display_name
    pen_name.presence || user.email.split("@").first
  end
end
