class UnitsController < ApplicationController
  before_action :authenticate_veterinarian!

  expose(:unit, attributes: :unit_params)

  def new
  end

  def create
    if unit.save
      redirect_to dictionaries_path(tab: 'units'), notice: 'Jednostka została pomyślnie dodana.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if unit.save
      redirect_to dictionaries_path(tab: 'units'), notice: 'Jednostka została pomyślnie edytowana.'
    else
      render :edit
    end
  end

  private

  def unit_params
    params.require(:unit).permit(:name)
  end
end
