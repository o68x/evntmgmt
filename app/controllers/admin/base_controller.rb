class Admin::BaseController < ApplicationController
  layout 'application_admin'
  # MAYBE: use devise roles for admin autentication?
  before_action do
    :authenticate_user!
    # SU is a global variable defining email of 'Super User"
    unless user_signed_in? && current_user.email == SU
      redirect_to root_path
      flash[:warning] = "Sorry, not an admin !"
    end
  end

  def some_shared_method
    # Do something
  end

end