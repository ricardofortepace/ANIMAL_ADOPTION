class AdoptionPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    user
  end

  def show?
    true
  end

  private

  def onwer_or_admin?
    user == record.user || user.admin
  end
end
