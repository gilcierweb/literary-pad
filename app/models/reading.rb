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

class Reading < ApplicationRecord
  belongs_to :user
  belongs_to :chapter

  validates :user_id, uniqueness: { scope: :chapter_id }

  scope :recent, -> { order(last_read_at: :desc) }

  def mark_as_read!
    update(progress: 100, last_read_at: Time.current)
  end

  def update_progress(percentage)
    update(progress: percentage, last_read_at: Time.current)
  end
end
