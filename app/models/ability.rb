# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end

    alias_action :create, :read, :update, :delete, :to => :crud

    can :crud, IdeaFactotry do |idea_factory|
      user == idea_factory.user
    end  

    can :crud, User, id: user.id
  end
end
