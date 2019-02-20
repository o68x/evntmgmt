class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :admin]

  def index
    @events = Event.reviewed
  end
  
  def show
    @event = Event.find(params[:id])
    @attendances = Attendance.where(event_id: @event.id)
    @attendants = @attendances.map { |a| User.find(a.user_id) }
  end

  def new
    if user_signed_in?
      flash[:notice] = "Let's go!"
      @event = Event.new
    else
      flash.now[:warning] = "You are not logged in!"
      render
    end
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      flash[:success] = "Event bien enregistré ! Bravo, top !"
      redirect_to @event
    else
      flash.now[:warning] = "Ooops, comme un blème.."
      render "new"
    end
  end

  def admin
    @event = Event.find(params[:id])
    if user_signed_in? && @event.user_id != current_user.id
      flash[:warning] = "You're not admin for this event !"
      redirect_back(fallback_location: root_path)
    end
    @attendances = Attendance.where(event_id: @event.id)
    @attendants = @attendances.map { |a| User.find(a.user_id) }
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:success] = "Votre event a été mis à jour !"
      redirect_to event_path @event
    else
      flash.now[:error] = "Problème, essayer encore !"
      render :new
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
    end
  end

  def destroy
      @event = Event.find(params[:id])
      @event.destroy
    
      redirect_to events_path
  end

end

private

def event_params
  params.require(:event).permit(:title, :description, :start_date, :price, :location, :duration, :user_id, :picture)
end

