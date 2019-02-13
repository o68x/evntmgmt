class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :admin]

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
    puts "et voici les event_params"
    puts event_params
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
    @event = Event.find(params[:id])
    @attendances = Attendance.where(event_id: @event.id)
    @attendants = @attendances.map { |a| User.find(a.user_id) }
    puts 'showattendants'
    puts params
    puts '=' * 50
  end

  def admin
    if Event.find(params[:admin_id]).admin == current_user
      @user = current_user
    else
      flash[:warning] = "You're not #{User.find(params[:id]).first_name} !"
      redirect_to edit_user_path(current_user)
    end
  end

  def admin
    @event = Event.find(params[:id])
    if @event.user_id != current_user.id
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
      flash[:error] = "Problème, essayer encore !"
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
  params.require(:event).permit(:title, :description, :start_date, :price, :location, :duration, :user_id)
end

