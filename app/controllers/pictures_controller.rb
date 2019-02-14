class PicturesController < ApplicationController
# TODO Pour l'instant on en reste là
  def create
    @event = Event.find(params[:event_id])
    @event.picture.attach(params[:picture])
    redirect_to(event_path(@event))
  end
end
