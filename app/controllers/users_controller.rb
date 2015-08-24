class UsersController < ApplicationController
  before_action :authenticate_user!, only: [ :show_profile ]
  before_action :authenticate_veterinarian!, only: [ :index, :show, :edit, :update ]

  expose(:user, attributes: :user_params)
  expose(:patients) { User.where(role: 0).order(:last_name).paginate(page: params[:page], per_page: 8) }

  def index
    if params[:search]
      self.patients = User.search(params[:search]).order(:last_name).paginate(page: params[:page], per_page: 8)
    end
  end

  def show
    @appointments = user.appointments.where('day >= ?', Date.today).order(:day).limit(3)
    @animals = user.animals.order(created_at: :desc).limit(3)
    @medical_records = user.medical_records.order(created_at: :desc).limit(3)
    @pictures = user.pictures.order(created_at: :desc).limit(3)
  end

  def edit
    user.build_address if user.address.nil?
  end

  def update
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if user.update(user_params)
      redirect_to user_path(user), notice: "Użytkownik został pomyślnie edytowany."
    else
      render :edit
    end
  end

  def show_profile
    if current_user.pacjent?
      @appointments = current_user.appointments.where('day >= ?', Date.today).order(:day).limit(3)
      @animals = current_user.animals.order(created_at: :desc).limit(3)
      @medical_records = current_user.medical_records.order(created_at: :desc).limit(3)
      @pictures = current_user.pictures.order(created_at: :desc).limit(3)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,
      :first_name, :last_name, :pesel, :phone_number, address_attributes:
        [ :id, :street, :house_number, :flat_number, :city, :borough, :district,
          :province, :country, :zip_code, :user_id ])
  end
end
