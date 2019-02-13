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
    puts '=' * 50 #ça affiche une ligne de 60 symboles $ facilement visible dans le terminal
    puts 'create event'
    puts params #tu sais que params doit s'afficher entre les 2
    puts '=' * 50
    @event = Event.new(event_params)
    
    if @event.save # essaie de sauvegarder en base @gossip
      flash[:success] = "Event bien enregistré ! Bravo, top !"
      redirect_to @event
    else
      flash[:warning] = "Ooops, comme un blème.."
      render "new"
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

end

private

def event_params
  params.require(:event).permit(:title, :description, :start_date, :duration, :user_id)
end

