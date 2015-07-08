class UsersController < ApplicationController
  expose(:user) { current_user }

  def show
  end
end
