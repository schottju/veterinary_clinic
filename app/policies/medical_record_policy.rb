class MedicalRecordPolicy < ApplicationPolicy
  def index?
    weterynarz? || owner?
  end

  def show?
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
