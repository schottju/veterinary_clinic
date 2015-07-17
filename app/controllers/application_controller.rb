class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:email, :password, :password_confirmation, :first_name,
               :last_name, :pesel, :phone_number,
               address_attributes: [ :street, :house_number, :flat_number,
                                     :city, :borough, :district, :province,
                                     :country, :zip_code, :user_id ])
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:email, :password, :password_confirmation, :current_password,
               :first_name, :last_name, :pesel, :phone_number,
               address_attributes: [ :street, :house_number, :flat_number,
                                     :city, :borough, :district, :province,
                                     :country, :zip_code, :user_id ])
    end
  end
end
