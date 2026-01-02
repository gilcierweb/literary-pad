class DiscoverController < ApplicationController
  def index
    @genres = Genre.all

    stories = Story.published_stories.includes(:user, :genres)

    stories = stories.joins(:genres).where(genres: { id: params[:genre_id] }) if params[:genre_id].present?
    stories = stories.where("title ILIKE ? OR description ILIKE ?", "%#{params[:q]}%", "%#{params[:q]}%") if params[:q].present?

    stories = case params[:sort]
              when "popular"
                stories.popular
              when "recent"
                stories.recent
              else
                stories.recent
              end

    @pagy, @stories = pagy(stories, items: 12)
  end
end
