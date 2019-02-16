class Admin::AdminController < ApplicationController
  before_action do
    :authenticate_user!
    unless current_user.email == 'admin@evntmgmt.com'
      redirect_to root_path
      flash[:warning] = "Sorry, not an admin !"
    end
  end
  def index
    puts "here's an index for admins"
  end
end

