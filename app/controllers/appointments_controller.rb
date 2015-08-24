class AppointmentsController < ApplicationController
  before_action :authenticate_user!, only: [ :index, :show, :new, :create, :cancel ]
  before_action :authenticate_veterinarian!, only: [ :edit, :update, :veterinarian_appointments, :veterinarian_appointment_cancel ]

  expose(:user) { User.find(params[:user_id]) }
  expose(:appointment, attributes: :appointment_params)
  expose(:appointments) { user.appointments.where("day >= ?", Date.today).order(:day).paginate(page: params[:page], per_page: 8) }

  def index
    if params[:search]
      self.appointments = Appointment.search(params[:search], params[:user_id]).order(:day).paginate(page: params[:page], per_page: 8)
    end
  end

  def show
  end

  def new
    self.appointment.veterinarian_id = params[:veterinarian_id]
    self.appointment.day = params[:day]
  end

  def create
    if appointment.save
      redirect_to user_appointments_path(user), notice: 'Wizyta została pomyślnie utworzona.'
    else
      render :new
    end
  end

  def edit
  end

  def update
     if appointment.save
      redirect_to user_appointments_path(user), notice: 'Wizyta została pomyślnie utworzona.'
    else
      render :edit
    end
  end

  def veterinarian_appointments
    if params[:search]
      self.appointments = Appointment.veterinarian_search(params[:search], current_user.try(:veterinarian)).order(:day).paginate(page: params[:page], per_page: 8)
    else
      self.appointments = Appointment.where("veterinarian_id = ? AND day >= ? AND user_id IS NOT NULL", current_user.try(:veterinarian), Date.today).order(:day).paginate(page: params[:page], per_page: 8)
    end
  end

  def cancel
    @appointment = Appointment.find(params[:appointment_id])
    if current_user.weterynarz? || user.id == @appointment.user_id
      if @appointment.status != "anulowana" && @appointment.update_attribute(:status, :anulowana)
        redirect_to user_appointments_path(user), notice: 'Anulowano wizytę'
      else
        redirect_to user_appointments_path(user), notice: 'Wizyta już posiada status anulowana.'
      end
    else
      render file: File.join(Rails.root, 'public/403.html'), status: 403, layout: false
    end
  end

  def veterinarian_appointment_cancel
    @appointment = Appointment.find(params[:id])
    if @appointment.status != "anulowana" && @appointment.update_attribute(:status, :anulowana)
      redirect_to veterinarian_appointments_path, notice: 'Anulowano wizytę'
    else
      redirect_to veterinarian_appointments_path, notice: 'Wizyta już posiada status anulowana.'
    end
  end

  private

    def appointment_params
      params.require(:appointment).permit(:status, :kind, :user_id, :veterinarian_id,
                                         :day, :time, :description)
    end
end
