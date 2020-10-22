class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    @user.has_role?(:teacher)
  end

  def create?
    @user.has_role?(:teacher)
  end

  def edit?
    # @user.has_role?(:admin) || @record.user == @user
    @record.user == @user
  end

  def update?
    # @user.has_role?(:admin) || @record.user == @user
    @record.user == @user
  end

  def destroy?
    @user.has_role?(:admin) || @record.user == @user
  end

  def owner?
    @record.user == @user
  end

  def approve?
    @user.has_role?(:admin)
  end
end
