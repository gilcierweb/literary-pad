class StoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_story, only: [:show, :edit, :update, :destroy, :publish]
  load_and_authorize_resource

  def index
    @pagy, @stories = pagy(Story.published_stories.includes(:user, :genres).recent, items: 12)
  end

  def show
    @story.increment_views! unless current_user == @story.user
    @chapters = @story.chapters.published.ordered
    @comments = @story.comments.includes(user: :profile).recent.limit(10)
  end

  def new
    @story = current_user.stories.build
  end

  def create
    @story = current_user.stories.build(story_params)
    current_user.add_role(:author) unless current_user.has_role?(:author)

    if @story.save
      redirect_to @story, notice: "Story created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @story.update(story_params)
      redirect_to @story, notice: "Story updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @story.destroy
    redirect_to dashboard_path, notice: "Story deleted successfully."
  end

  def publish
    if @story.publish!
      redirect_to @story, notice: "Story published successfully."
    else
      redirect_to @story, alert: "Unable to publish story."
    end
  end

  private

  def set_story
    @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:title, :description, :cover_image, :status, genre_ids: [])
  end
end
