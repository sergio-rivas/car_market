class CarPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new2?
    true
  end

  def create?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def create_via_vin?
    true
  end
end
