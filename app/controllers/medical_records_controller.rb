class MedicalRecordsController < ApplicationController
  expose(:medical_record, attributes: :medical_record_params)
  expose(:user) { User.find(params[:user_id]) }

  def index
  end

  def show
  end

  def new
  end

  def create
    if medical_record.save
      redirect_to user_medical_record_path(user, medical_record), notice: 'Nowy wpis w kartotece został utworzony.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if medical_record.save
      redirect_to user_medical_record_path(user, medical_record), notice: 'Wpis w kartotece został edytowany.'
    else
      render :edit
    end
  end

  private

  def medical_record_params
    params.require(:medical_record).permit(
        :anamnesis, :description, :comment, :user_id, :veterinarian_id, :additional_cost, :total_cost,
        treatment_ids: [], image_ids: [], disease_ids: [], animal_ids: [],
        medicines_attributes: [ :id, :name, :description, :amount, :grace_period, :price, :serial_number, :dosage, :unit_id, :_destroy ]
    )
  end
end
