class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_commentable

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_back(fallback_location: root_path, notice: "Comment added.") }
      end
    else
      respond_to do |format|
        format.html { redirect_back(fallback_location: root_path, alert: "Could not add comment.") }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize! :manage, @comment
    @comment.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_back(fallback_location: root_path, notice: "Comment deleted.") }
    end
  end

  private

  def set_commentable
    if params[:story_id]
      @commentable = Story.find(params[:story_id])
    elsif params[:chapter_id]
      @commentable = Chapter.find(params[:chapter_id])
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
