class Admins::RegistrationsController < Devise::RegistrationsController
  # GET /resource/sign_up
  def create


    if params[:bridge_house_pin].to_s == '5280'
      super
    else
      redirect_to new_ticket_path, notice: 'Sorry, you can\'t create an account'
    end
  end

end
