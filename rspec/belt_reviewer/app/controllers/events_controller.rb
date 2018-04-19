class EventsController < ApplicationController
  before_action :check_permission, only: [:edit, :update, :destroy]

  def index
    @user_state_events = Event.where("events.state = '#{current_user.state}'")
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end
end
