class Admin::UsersController < Admin::BaseController


  def index
    puts "=" * 50
    puts "here's your index"
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @events = Event.where(user_id: @user.id)
    attendances = Attendance.where(user_id: @user.id)
    @attended_events = attendances.map { |e| Event.find(e.event_id) }
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
