class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.new(user_params)
  end

  def welcome
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

end
