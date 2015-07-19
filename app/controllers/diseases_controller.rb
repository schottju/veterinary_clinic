class DiseasesController < ApplicationController
  expose(:disease, attributes: :disease_params)

  def new
  end

  def create
    if disease.save
      redirect_to dictionaries_path, notice: 'Choroba została pomyślnie dodana.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if disease.update(disease_params)
      redirect_to dictionaries_path, notice: 'Choroba została pomyślnie edytowana.'
    else
      render :edit
    end
  end

  private

  def disease_params
    params.require(:disease).permit(:name)
  end
end
