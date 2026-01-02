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

class Story < ApplicationRecord
  belongs_to :user

  has_many :chapters, -> { order(position: :asc) }, dependent: :destroy
  has_many :story_genres, dependent: :destroy
  has_many :genres, through: :story_genres
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_by_users, through: :favorites, source: :user

  enum :status, { draft: 0, published: 1, completed: 2 }

  validates :title, presence: true, length: { minimum: 3, maximum: 200 }
  validates :description, length: { maximum: 2000 }

  scope :recent, -> { order(created_at: :desc) }
  scope :popular, -> { order(views_count: :desc, likes_count: :desc) }
  scope :published_stories, -> { where(status: :published).or(where(status: :completed)) }

  after_initialize :set_defaults, if: :new_record?

  def published?
    published_at.present?
  end

  def publish!
    update(status: :published, published_at: Time.current) unless published?
  end

  def complete!
    update(status: :completed)
  end

  def increment_views!
    increment!(:views_count)
  end

  def author_name
    user.profile.display_name
  end

  private

  def set_defaults
    self.views_count ||= 0
    self.likes_count ||= 0
    self.comments_count ||= 0
    self.status ||= :draft
  end
end
