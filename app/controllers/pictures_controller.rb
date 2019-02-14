class PicturesController < ApplicationController
# TODO Pour l'instant on en reste là

def create
    puts 'new pic params'
    puts params #tu sais que params doit s'afficher entre les 2
    puts '=' * 50
    @event = Event.find(params[:event_id])
    @event.picture.attach(params[:picture])
    redirect_to(event_path(@event))
  end
end

private

def article_params
  params.require(:event).permit(:event_id, :picture)
end