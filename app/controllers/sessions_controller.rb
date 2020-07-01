class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:sessions][:name].capitalize())

    if @user
      log_in @user
      redirect_to root_path
    else
      flash[:danger] = "Incorrect name or Sign up if you don't have an account"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
