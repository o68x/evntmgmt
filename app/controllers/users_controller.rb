class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @events = Event.where(user_id: params[:id])
    p @events
    render 'show'
  end

end
