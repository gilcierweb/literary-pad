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

FactoryBot.define do
  factory :reading do
    user { nil }
    chapter { nil }
    progress { 1 }
    last_read_at { "2026-01-02 06:49:54" }
  end
end
