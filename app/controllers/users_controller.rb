class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @user_events = @user.hosted_events.order('date DESC')
    @attending = @user.attended_events
    @upcoming = @user_events.upcoming_events(Time.zone.now)
    @past = @user_events.past_events(Time.zone.now)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      flash[:success] = 'Welcome to Eventte'
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
