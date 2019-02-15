class Admin::UsersController < ApplicationController
  # TODO Make it CRUD
  def index
    puts "=" * 50
    puts "here's your index"
    @users = User.all
  end
end
