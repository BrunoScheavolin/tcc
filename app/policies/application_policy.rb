# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def admin?
    @user.admin?
  end

  def client?
    @user.client?
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def is_user?
      @user.is_a?(User) ? true : false
    end

    def resolve
      raise(NotImplementedError, "You must define #resolve in #{self.class}")
    end

    private

    attr_reader :user, :scope
  end
end
