class Admin::UsersController < ApplicationController
  before_action do
    :authenticate_user!
    unless current_user.email == 'admin@evntmgmt.com'
      redirect_to root_path
      flash[:warning] = "Sorry, not an admin !"
    end
  end
  # TODO Make it CRUD
  def index
    puts "=" * 50
    puts "here's your index"
    @users = User.all
  end

  def show
    puts "=" * 50
    puts "here's your show"
    puts params
    @user = User.find(params[:id])
    @events = Event.where(user_id: @user.id)
    attendances = Attendance.where(user_id: @user.id)
    @attended_events = attendances.map { |e| Event.find(e.event_id) }
    puts @attended_events
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to request.referrer
  end
end
