class HomeController < ApplicationController
  def index
      @featured_stories = Story.published_stories.includes(user: :profile, genres: []).popular.limit(6)
      @recent_stories = Story.published_stories.includes(user: :profile, genres: []).recent.limit(8)
      @popular_genres = Genre.joins(:stories).group(:id).order("COUNT(stories.id) DESC").limit(8)
  end
end
