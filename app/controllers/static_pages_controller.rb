class StaticPagesController < ApplicationController
  expose(:units)
  expose(:species) { Species.all }
  expose(:diseases)
  expose(:treatments)

  def dictionaries
  end
end
