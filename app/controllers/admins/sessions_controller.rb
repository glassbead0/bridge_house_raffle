class Admins::SessionsController < Devise::SessionsController

  def destroy
    current_admin.event.delete if current_admin.event
    current_admin.event = nil
    super
  end

end
