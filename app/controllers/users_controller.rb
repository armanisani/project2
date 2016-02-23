class UsersController < ApplicationController
  before_action :authorize, only: [:show]


  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params.require(:user).permit(:username))
      redirect_to index_path
    else
      render :edit
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    elsif !@user.valid?
      redirect_to new_user_path
      flash[:failure] = "Username already exists. Use another"
    elsif !@user.email.valid?
      redirect_to new_user_path
      flash[:failure] = "Email already exists"
    else
      flash[:failure] = "Please complete all fields"
      redirect_to new_user_path
    end
  end

  def destroy
    @user = User.find(params[:id])
  @user.destroy
  redirect_to user_path
  end
private
  def user_params
    params.require(:user).permit(:username,:first,:last,:age, :email, :password, :avatar)
  end
end
