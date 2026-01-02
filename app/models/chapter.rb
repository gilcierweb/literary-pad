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

class Chapter < ApplicationRecord
  belongs_to :story, counter_cache: true
  has_many :readings, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  validates :title, presence: true, length: { maximum: 200 }
  validates :content, presence: true
  validates :position, presence: true, numericality: { only_integer: true, greater_than: 0 }

  scope :published, -> { where.not(published_at: nil) }
  scope :ordered, -> { order(position: :asc) }

  before_validation :set_position, on: :create

  def published?
    published_at.present?
  end

  def publish!
    update(published_at: Time.current) unless published?
  end

  def next_chapter
    story.chapters.where("position > ?", position).ordered.first
  end

  def previous_chapter
    story.chapters.where("position < ?", position).order(position: :desc).first
  end

  def increment_views!
    increment!(:views_count)
  end

  def word_count
    content.to_s.split.size
  end

  def reading_time
    (word_count / 200.0).ceil # Assuming 200 words per minute
  end

  private

  def set_position
    self.position ||= (story.chapters.maximum(:position) || 0) + 1
  end
end
