class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @my_stories = current_user.stories.includes(:chapters).recent
    @reading_history = current_user.readings.includes(chapter: :story).recent.limit(10)
    @favorites = current_user.favorited_stories.includes(:user).recent.limit(6)

    @stats = {
      stories_count: current_user.stories.count,
      total_views: current_user.stories.sum(:views_count),
      total_likes: current_user.stories.sum(:likes_count),
      followers_count: current_user.followers.count
    }
  end
end
