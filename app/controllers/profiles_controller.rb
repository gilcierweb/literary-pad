class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_user, only: [:show]
  before_action :set_profile, only: [:edit, :update]

  def show
    @stories = @user.stories.published_stories.recent
    @followers = @user.followers.limit(10)
    @following = @user.following.limit(10)
  end

  def edit
    authorize! :manage, @profile
  end

  def update
    authorize! :manage, @profile

    if @profile.update(profile_params)
      redirect_to profile_path(current_user), notice: "Profile updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:pen_name, :bio, :avatar, :location, :website, :social_links)
  end
end
