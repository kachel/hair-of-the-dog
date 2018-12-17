class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to @user
    else
      render new_user_url
    end
  end

  def edit
   @user = User.find_by(id: params[:id])
  end

  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
     redirect_to @user
   else
     render edit_user_path(@user)
   end
  end

  def welcome
    current_user
  end


  private

    def user_params
      params.require(:user).permit(:email, :password)
    end

end
