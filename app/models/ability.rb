# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md

    user ||= User.new # Guest user

    # Everyone can read published content
    can :read, Story, status: [:published, :completed]
    can :read, Chapter, story: { status: [:published, :completed] }
    can :read, Genre
    can :read, Profile

    if user.persisted?
      # Readers can interact
      can :create, Comment
      can :manage, Comment, user_id: user.id
      can [:like, :unlike], [Story, Chapter]
      can [:favorite, :unfavorite], Story
      can [:follow, :unfollow], User
      can :manage, Profile, user_id: user.id

      # Authors can manage their own content
      if user.has_role?(:author) || user.has_role?(:admin)
        can :create, Story
        can :manage, Story, user_id: user.id
        can :manage, Chapter, story: { user_id: user.id }
      end

      # Admins can manage everything
      if user.has_role?(:admin)
        can :manage, :all
      end
    end
  end
end
