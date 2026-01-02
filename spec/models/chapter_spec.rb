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

require 'rails_helper'

RSpec.describe Chapter, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
