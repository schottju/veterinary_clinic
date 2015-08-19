class VeterinariansController < ApplicationController
  expose(:veterinarians) { User.where(role: 1).order(:last_name).paginate(page: params[:page], per_page: 8) }

  def index
    if params[:search]
      self.veterinarians = User.veterinarian_search(params[:search]).order(:last_name).paginate(page: params[:page], per_page: 8)
    end
  end
end
