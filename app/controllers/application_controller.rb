class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def require_admin
    if !admin_signed_in?
      redirect_to ticket_new_wepay_path, notice: 'nice try'
    end
  end
end
