class Admins::RegistrationsController < Devise::RegistrationsController
  # GET /resource/sign_up
  def create
    if params[:bridge_house_pin].to_s == ENV['BRIDGEHOUSE_PIN']
      super
    else
      redirect_to root_path, notice: 'Sorry, wrong pin. you can\'t create an account'
    end
  end

end
