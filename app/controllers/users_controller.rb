class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @events = Event.where(user_id: params[:id])
    p @events
  end

  def edit
    if User.find(params[:id]) == current_user
      @user = current_user
    else
      flash[:warning] = "You're not #{User.find(params[:id]).first_name} !"
      redirect_to edit_user_path(current_user)
    end
  end

  def new

  end

  def create

  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Votre profil a été mis à jour !"
      redirect_to user_path @user
    else
      flash.now[:error] = "Problème, essayer encore !"
      render :new
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
    end
  end

end

private

def user_params
  params.require(:user).permit(:first_name, :last_name, :description, :avatar)
end