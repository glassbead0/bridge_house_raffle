class EventsController < ApplicationController
  before_action :require_admin

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      current_admin.event = @event
      redirect_to new_ticket_path, notice: "Started event at #{@event.name}"
    else
      render :new
    end
  end


  def destroy
    @event = current_admin.event
    @event.destroy
    redirect_to tickets_path
  end

  private

  def event_params
    params.require(:event).permit(:name)
  end
end
