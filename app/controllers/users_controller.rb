class UsersController < ApplicationController
  def index
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      redirect_to new_user_path
    end
  end

  def destroy
  end
private
  def user_params
    params.require(:user).permit(:username,:first,:last,:age, :emaiL, :avatar)
  end
end
