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

require 'rails_helper'

RSpec.describe Profile, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
