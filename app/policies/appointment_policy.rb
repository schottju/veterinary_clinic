class AppointmentPolicy < ApplicationPolicy
  def index?
    weterynarz? || owner?
  end

  def show?
    weterynarz? || owner?
  end

  def cancel?
    weterynarz? || owner?
  end

  private
    def weterynarz?
      user.present? && user.weterynarz?
    end

    def owner?
      record.user == user
    end
end
