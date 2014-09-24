class Admins::SessionsController < Devise::SessionsController

  def destroy
    current_admin.event = nil
    current_admin.event.delete
    super
  end

end
