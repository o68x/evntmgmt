class Admin::BaseController < ApplicationController
  layout 'application_admin'
  before_action do
    :authenticate_user!
    unless current_user.email == 'admin@evntmgmt.com'
      redirect_to root_path
      flash[:warning] = "Sorry, not an admin !"
    end
  end
  
  def some_shared_method
    # Do something
  end

end