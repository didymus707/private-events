class EventAttendancesController < ApplicationController
  def new
    @event_attendance = EventAttendance.new
  end

  def create
    @event_attendance = current_user.event_attendances.build(attendants_params)
    if @event_attendance.save
      redirect_to current_user
    else
      render :new
    end
  end

  private

  def attendants_params
    params.require(:event_attendance).permit(:event_attendee_id, :attended_event_id)
  end
end
