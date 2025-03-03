class AdminPolicy < ApplicationPolicy
  def admin
    user.admin?
  end
end
