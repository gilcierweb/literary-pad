class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @story = Story.find(params[:story_id])
    current_user.favorite(@story)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_back(fallback_location: root_path) }
    end
  end

  def destroy
    @story = Story.find(params[:story_id])
    current_user.unfavorite(@story)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_back(fallback_location: root_path) }
    end
  end
end
