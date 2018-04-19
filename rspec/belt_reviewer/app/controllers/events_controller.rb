class EventsController < ApplicationController
  before_action :require_login

  def index
    @user_state_events = Event.where("events.state = '#{current_user.state}'")
    @other_events = Event.where("events.state != '#{current_user.state}'")
  end

  def create
    @event = Event.new(event_params)
    @event.state = params[:state]
    @event.user = current_user
    unless @event.save
      flash[:errors] = @event.errors.full_messages
    end
    redirect_to :events
  end

  def edit
    @event = Event.find(params[:event_id])
  end

  def update
    @event = Event.update(params[:event_id], event_params)
    @event.update(state: params[:state])
    if @event.errors.full_messages != []
      flash[:errors] = @event.errors.full_messages
      redirect_to "events/#{@event.id}/edit"
    end
    redirect_to :events
  end

  def show
    @event = Event.find(params[:event_id])
  end

  def destroy
    @event = Event.find(params[:event_id])
    if @event.user.id == current_user.id
      @event.destroy
      redirect_to :events
    end
  end

  def attend
    Attendee.create(event: Event.find(params[:event_id]), user: User.find(current_user.id))
    redirect_to :events
  end

  def cancel
    @attendee = Attendee.find_by(event_id: Event.find(params[:event_id]), user: User.find(current_user.id))
    @attendee.destroy
    redirect_to :events
  end

  private
    def event_params
      params.require(:event).permit(:name, :event_date, :location, :state)
    end

end
