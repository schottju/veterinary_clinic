class StaticPagesController < ApplicationController
  expose(:units) { Unit.all.order(:name).paginate(page: params[:units_page], per_page: 8) }
  expose(:species) { Species.all.order(:name).paginate(page: params[:species_page], per_page: 8) }
  expose(:diseases) { Disease.all.order(:name).paginate(page: params[:diseases_page], per_page: 8) }
  expose(:treatments) { Treatment.all.order(:name).paginate(page: params[:treatments_page], per_page: 8) }

  def dictionaries
  end

  def units_search
    if params[:search]
      self.units = Unit.search(params[:search]).order(:name).paginate(page: params[:units_page], per_page: 8)
      params[:tab] = 'units'
    end
  end

  def species_search
    if params[:search]
      params[:tab] = 'species'
      self.species = Species.search(params[:search]).order(:name).paginate(page: params[:species_page], per_page: 8)
    end
  end

  def diseases_search
    if params[:search]
      self.diseases = Disease.search(params[:search]).order(:name).paginate(page: params[:diseases_page], per_page: 8)
      params[:tab] = 'diseases'
    end
  end

  def treatments_search
    if params[:search]
      self.treatments = Treatment.search(params[:search]).order(:name).paginate(page: params[:treatments_page], per_page: 8)
      params[:tab] = 'treatments'
    end
  end

  def help_page

  end
end
