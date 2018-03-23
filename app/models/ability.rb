class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new

    case user.role
    when "admin"
      can :access, :rails_admin
      can :dashboard
      can :manage, :all
      cannot :manage, [AverageCache, OverallAverage, RatingCache]
    when "user"
      can [:update, :destroy], Comment, user_id: user.id
      can [:read, :search], [Mobile]
      can :manage, [Comment, Order], user_id: user.id
    end
  end
end
