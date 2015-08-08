class RegistrationsController < Devise::RegistrationsController
  def new
    resource = build_resource({})
    resource.build_address
    respond_with resource
  end

  def create
    if verify_recaptcha
      super
    else
      build_resource(sign_up_params)
      clean_up_passwords(resource)
      flash.now[:error] = "Wystąpił problem z reCaptcha, proszę zaznaczyć ponownie."
      flash.delete :recaptcha_error
      render :new
    end
  end

  def edit
    super
  end

  def update
    super
  end
end
