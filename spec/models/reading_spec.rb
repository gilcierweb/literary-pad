# == Schema Information
#
# Table name: readings
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  chapter_id   :integer          not null
#  progress     :integer
#  last_read_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_readings_on_chapter_id  (chapter_id)
#  index_readings_on_user_id     (user_id)
#

require 'rails_helper'

RSpec.describe Reading, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
