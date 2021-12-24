class ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(enabled: true)
    end
  end

  def index?
    true
  end

  def create?
    true
  end
end
