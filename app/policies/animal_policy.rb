class AnimalPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    user
  end

  def update?
    onwer_or_admin?
  end

  def destroy?
    onwer_or_admin?
  end

  private

  def onwer_or_admin?
    user == record.user || user.admin
  end
end
