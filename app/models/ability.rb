# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)

    alias_action :create, :read, :update, :delete, :to => :crud

    can :crud, IdeaFactory do |idea_factory|
      user == idea_factory.user
    end  

    can(:like, IdeaFactory) do |idea_factory|
      user.persisted? && idea_factory.user != user
      # check if user is saved in the database
      # check if the owner of the question is not the current user
    end

    can :crud, Review do |review|
      user == review.user
    end

    can(:destroy, Like) do |like|
      like.user == user
    end

    can :crud, User, id: user.id
  end
end
