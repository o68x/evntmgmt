class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @events = Event.where(user_id: params[:id])
    p @events
    render 'show'
  end

  def edit
    if User.find(params[:id]) == current_user
      @user = current_user
    else
      flash[:warning] = "You're not #{User.find(params[:id]).first_name} !"
      redirect_to edit_user_path(current_user)
    end
  end

end
