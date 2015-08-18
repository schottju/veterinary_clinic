class TreatmentsController < ApplicationController
  before_action :authenticate_veterinarian!, except: [ :index ]

  expose(:treatment, attributes: :treatment_params)
  expose(:treatments) { Treatment.all.order(:name).paginate(page: params[:page], per_page: 8) }

  def index
    if params[:search]
      self.treatments = Treatment.price_page_search(params[:search]).order(:name).paginate(page: params[:treatments_page], per_page: 8)
    end
  end

  def new
  end

  def create
    treatment.cost = change_comma_to_period(params[:treatment][:cost])
    if treatment.save
      redirect_to dictionaries_path(tab: 'treatments'), notice: 'Zabieg został pomyślnie dodany.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    treatment.cost = change_comma_to_period(params[:treatment][:cost])
    if treatment.save
      redirect_to dictionaries_path(tab: 'treatments'), notice: 'Zabieg został pomyślnie edytowany.'
    else
      render :edit
    end
  end

  private

  def treatment_params
    params.require(:treatment).permit(:name, :cost, :description)
  end
end
