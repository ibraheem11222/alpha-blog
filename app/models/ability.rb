# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role?(:admin)
      can :manage, :all
    else
      can :manage, Article if user.has_role?(:author, Article)
      can :read, :all

    end
  end
end
