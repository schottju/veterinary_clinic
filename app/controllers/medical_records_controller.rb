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
  end

  def edit
  end

  def update
  end

  private

  def medical_record_params
    params.require(:medical_record).permit(:anamnesis, :description, :comment, :user_id, :veterinarian_id, :additional_cost, :total_cost, treatment_ids: [], image_ids: [], disease_ids: [], medicine_ids: [], animal_ids: [])
  end
end
