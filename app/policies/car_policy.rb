class CarPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def vin?
    create?
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

  def create_from_vin?
    true
  end
end
