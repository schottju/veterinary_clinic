class UnitsController < ApplicationController
  expose(:unit, attributes: :unit_params)

  def new
  end

  def create
    if unit.save
      redirect_to dictionaries_path, notice: 'Jednostka została pomyślnie dodana.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if unit.update(unit_params)
      redirect_to dictionaries_path, notice: 'Jednostka została pomyślnie edytowana.'
    else
      render :edit
    end
  end

  private

  def unit_params
    params.require(:unit).permit(:name)
  end
end
