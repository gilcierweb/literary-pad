class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_one :profile, dependent: :destroy
  has_many :stories, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_stories, through: :favorites, source: :story
  has_many :readings, dependent: :destroy

  has_many :active_follows, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_follows, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_follows, source: :followed
  has_many :followers, through: :passive_follows, source: :follower

  after_create :create_default_profile
  after_create :assign_default_role

  def follow(other_user)
    active_follows.create(followed_id: other_user.id) unless self == other_user
  end

  def unfollow(other_user)
    active_follows.find_by(followed_id: other_user.id)&.destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def like(likeable)
    likes.find_or_create_by(likeable: likeable)
  end

  def unlike(likeable)
    likes.find_by(likeable: likeable)&.destroy
  end

  def liked?(likeable)
    likes.exists?(likeable: likeable)
  end

  def favorite(story)
    favorites.find_or_create_by(story: story)
  end

  def unfavorite(story)
    favorites.find_by(story: story)&.destroy
  end

  def favorited?(story)
    favorites.exists?(story: story)
  end

  private

  def create_default_profile
    create_profile! unless profile
  end

  def assign_default_role
    add_role(:reader) if roles.blank?
  end
end
