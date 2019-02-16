class Admin::AdminController < ApplicationController
  before_action :authenticate_user!
  def index
    puts "here's an index for admins"
  end
end
