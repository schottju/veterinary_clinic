class UsersController < ApplicationController
  expose(:user)
  expose(:patients) { User.where(role: 'patient') }

  def show
  end

  def index
  end

  def edit
  end

  def update
  end
end
