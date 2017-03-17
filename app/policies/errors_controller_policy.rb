class ErrorsControllerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def not_found?
    true
  end

  def internal_server_error?
    true
  end
end
