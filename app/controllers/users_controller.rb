class UsersController < ApplicationController

  def show
    @users = User.params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end

  private

  def user_params
    params.require(:users).permit(:name, :email)
  end
end
