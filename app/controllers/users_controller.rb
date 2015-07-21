class UsersController < ApplicationController
  expose(:user, attributes: :user_params)
  expose(:patients) { User.where(role: 'patient').order(:last_name).paginate(page: params[:page], per_page: 8) }

  def show
  end

  def index
    if params[:search]
      self.patients = User.search(params[:search]).order(:last_name).paginate(page: params[:page], per_page: 8)
    end
  end

  def new
    user.build_address
  end

  def create
    user.skip_confirmation!
    if user.save
      redirect_to users_path, notice: 'Użytkownik został pomyślnie utworzony.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if user.update(user_params)
      redirect_to users_path, notice: "Użytkownik został pomyślnie edytowany."
    else
      render :edit
    end
  end

  def show_profile
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,
      :first_name, :last_name, :pesel, :phone_number, address_attributes:
        [ :id, :street, :house_number, :flat_number, :city, :borough, :district,
          :province, :country, :zip_code, :user_id ])
  end
end
