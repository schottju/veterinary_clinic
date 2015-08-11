class AppointmentsController < ApplicationController
  before_action :authenticate_user!, only: [ :index, :show, :new, :create ]
  before_action :authenticate_veterinarian!, only: [ :edit, :update, :veterinarian_appointments ]

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
      self.appointments = Appointment.where("veterinarian_id = ? AND day >= ?", current_user.try(:veterinarian), Date.today).order(:day).paginate(page: params[:page], per_page: 8)
    end
  end

  private

    def appointment_params
      params.require(:appointment).permit(:status, :kind, :user_id, :veterinarian_id,
                                         :day, :time, :description)
    end
end
