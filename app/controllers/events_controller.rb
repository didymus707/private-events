class EventsController < ApplicationController
  
  def index
    @events = Event.all.order('created_at DESC')
    @past = Event.past_events(Time.zone.now).order('date DESC')
    @upcoming = Event.upcoming_events(Time.zone.now).order('date ASC')
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
    # @user_events = User.find_by(id: @event.id).hosted_events
  end

  def new
    @event = current_user.hosted_events.build
  end

  def create
    @event = current_user.hosted_events.build(event_params)

    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:location, :date, :description)
  end
end