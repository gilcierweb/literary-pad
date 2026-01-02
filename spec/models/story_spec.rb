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

require 'rails_helper'

RSpec.describe Story, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
