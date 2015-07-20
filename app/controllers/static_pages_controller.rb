class StaticPagesController < ApplicationController
  expose(:units) { Unit.all.order(:name).paginate(page: params[:units_page], per_page: 8) }
  expose(:species) { Species.all.order(:name).paginate(page: params[:species_page], per_page: 8) }
  expose(:diseases) { Disease.all.order(:name).paginate(page: params[:diseases_page], per_page: 8) }
  expose(:treatments) { Treatment.all.order(:name).paginate(page: params[:treatments_page], per_page: 8) }

  def dictionaries
  end
end
