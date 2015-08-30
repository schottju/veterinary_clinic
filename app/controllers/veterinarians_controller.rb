class VeterinariansController < ApplicationController
  expose(:veterinarians) { User.where(role: 1).order(:last_name).paginate(page: params[:page], per_page: 8) }
  expose(:user) { User.find(params[:user_id]) }

  def index
    if params[:search]
      self.veterinarians = User.veterinarian_search(params[:search]).order(:last_name).paginate(page: params[:page], per_page: 8)
    end
  end

  def show_calendar
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @veterinarian = Veterinarian.find(params[:id])
  end

  def index_veterinarians
    if params[:search]
      self.veterinarians = User.veterinarian_search(params[:search]).order(:last_name).paginate(page: params[:page], per_page: 8)
    end
  end
end
