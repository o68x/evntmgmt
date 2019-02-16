class Admin::EventsController < ApplicationController
  before_action do
    :authenticate_user!
    unless current_user.email == 'admin@evntmgmt.com'
      redirect_to root_path
      flash[:warning] = "Sorry, your're not admin !"
    end
  end
  
  def index
    @events = Event.all
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
