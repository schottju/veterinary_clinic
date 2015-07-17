class AnimalsController < ApplicationController
  before_action :authenticate_user!

  expose(:animal)
  expose(:animals) { current_user.animals }
  expose(:species)

  def index
  end

  def show
  end

  def new
  end

  def create
    self.animal = Animal.new(animal_params)

    if animal.save
      redirect_to user_animal_path(current_user, animal), notice: 'Animal was successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if animal.update(animal_params)
      redirect_to user_animal_path(current_user, animal), notice: 'Animal was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
  end

  private

  def animal_params
    params.require(:animal).permit(:id_number, :name, :birth_date, :amount,
                                   :weight, :gender, :age, :description,
                                   :user_id, :species_id)
  end
end
