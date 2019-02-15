class Admin::UsersController < ApplicationController
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
end
