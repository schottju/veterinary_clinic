class AnimalsController < ApplicationController
  before_action :authenticate_user!

  expose(:user) { User.find(params[:user_id]) }
  expose(:animal, attributes: :animal_params)
  expose(:animals) { Animal.where(user_id: params[:user_id]).paginate(page: params[:page], per_page: 8) }
  expose(:species) { Species.all.order(:name) }

  def index
  end

  def show
  end

  def new
  end

  def create
    if animal.save
      redirect_to user_animals_path(params[:user_id]), notice: 'Animal was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if animal.update(animal_params)
      redirect_to user_animals_path(params[:user_id]), notice: 'Animal was successfully updated.'
    else
      render :edit
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
