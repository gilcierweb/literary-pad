# == Schema Information
#
# Table name: genres
#
#  id          :integer          not null, primary key
#  name        :string
#  slug        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Genre < ApplicationRecord
  has_many :story_genres, dependent: :destroy
  has_many :stories, through: :story_genres

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true

  before_validation :generate_slug, on: :create

  private

  def generate_slug
    self.slug ||= name.to_s.parameterize
  end
end
