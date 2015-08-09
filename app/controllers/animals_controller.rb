class AnimalsController < ApplicationController
  before_action :authenticate_user!, only: [ :index, :show ]
  before_action :authenticate_veterinarian!, only: [ :new, :create, :edit, :update ]

  expose(:user) { User.find(params[:user_id]) }
  expose(:animal, attributes: :animal_params)
  expose(:animals) { user.animals.paginate(page: params[:page], per_page: 8) }
  expose(:species) { Species.all.order(:name) }

  def index
    if params[:search]
      self.animals = Animal.search(params[:search], params[:user_id]).order(:created_at).paginate(page: params[:page], per_page: 8)
    end
  end

  def show
  end

  def new
  end

  def create
    animal.weight = change_comma_to_period(params[:animal][:weight])
    animal.age = change_comma_to_period(params[:animal][:age])
    if animal.save
      redirect_to user_animals_path(user), notice: 'Zwierzę zostało pomyślnie utworzone.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    animal.weight = change_comma_to_period(params[:animal][:weight])
    animal.age = change_comma_to_period(params[:animal][:age])
    if animal.save
      redirect_to user_animals_path(user), notice: 'Zwierzę zostało pomyślnie edytowane.'
    else
      render :edit
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:id_number, :name, :birth_date, :amount,
                                   :weight, :gender, :age, :description,
                                   :user_id, :species_id)
  end
end
