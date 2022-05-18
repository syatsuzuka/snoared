class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.roles.where(name: "admin").any?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    true
  end

  def edit?
    update?
  end

  def destroy?
    true
  end

  def all?
    user.roles.where(name: "admin").any?
  end
end
