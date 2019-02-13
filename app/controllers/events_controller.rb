class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @events = Event.all
  end

  def new
    if user_signed_in?
      flash[:notice] = "Let's go!"
      @event = Event.new
    else
      flash[:warning] = "You are not logged in!"
      render
    end
  end

  def create
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

end
