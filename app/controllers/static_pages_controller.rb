class StaticPagesController < ApplicationController
  expose(:units) { Unit.all.order(:name) }
  expose(:species) { Species.all.order(:name) }
  expose(:diseases) { Disease.all.order(:name) }
  expose(:treatments) { Treatment.all.order(:name) }

  def dictionaries
  end
end
