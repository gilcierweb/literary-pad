class HomeController < ApplicationController
  def index
      @featured_stories = Story.published_stories.popular.limit(6)
      @recent_stories = Story.published_stories.recent.limit(8)
      @popular_genres = Genre.joins(:stories).group(:id).order("COUNT(stories.id) DESC").limit(8)
  end
end
