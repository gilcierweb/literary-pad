class ChaptersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_story
  before_action :set_chapter, only: [:show, :edit, :update, :destroy]
  authorize_resource

  def show
    authorize! :read, @chapter
    @chapter.increment_views! unless current_user == @story.user

    if current_user
      @reading = @chapter.readings.find_or_create_by(user: current_user)
      @reading.mark_as_read!
    end

    @comments = @chapter.comments.includes(user: :profile).recent.limit(10)
  end

  def new
    @chapter = @story.chapters.build
  end

  def create
    @chapter = @story.chapters.build(chapter_params)

    if @chapter.save
      redirect_to [@story, @chapter], notice: "Chapter created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @chapter.update(chapter_params)
      redirect_to [@story, @chapter], notice: "Chapter updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @chapter.destroy
    redirect_to @story, notice: "Chapter deleted successfully."
  end

  private

  def set_story
    @story = Story.find(params[:story_id])
  end

  def set_chapter
    @chapter = @story.chapters.find(params[:id])
  end

  def chapter_params
    params.require(:chapter).permit(:title, :content, :position)
  end
end
