class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  
  def show
    @event = Event.find(params[:id])
    @user_events = User.find_by(id: @event).hosted_events
  end
  
  def new
    @event = current_user.hosted_events.build
  end

  def create
    @event = current_user.hosted_events.build(event_params)
    
    if @event.save
      redirect_to events_path
    else
      render 'new'
    end
  end


  private

  def event_params
    params.require(:event).permit(:location, :description)
  end
end
