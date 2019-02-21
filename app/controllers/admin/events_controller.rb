class Admin::EventsController < Admin::BaseController

  def index
    @events = Event.all.sort_by { |k| k[:start_date] }
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to request.referrer
  end

end
