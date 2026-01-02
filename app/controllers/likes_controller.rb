class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @likeable = find_likeable
    current_user.like(@likeable)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_back(fallback_location: root_path) }
    end
  end

  def destroy
    @likeable = find_likeable
    current_user.unlike(@likeable)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_back(fallback_location: root_path) }
    end
  end

  private

  def find_likeable
    if params[:story_id]
      Story.find(params[:story_id])
    elsif params[:chapter_id]
      Chapter.find(params[:chapter_id])
    end
  end
end
