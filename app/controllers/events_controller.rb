class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    current_admin.event = @event
    redirect_to new_ticket_path, notice: "Started event at #{@event.name}"
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
