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
    if current_user != @user
      redirect_to users_path
    end

  end

  def update
    @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        redirect_to show_user_path(current_user)
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
      redirect_to new_session_path
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

  def delete
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to show_user_path(current_user)
    else
      redirect_to logout_path
      @user.destroy
    end
  end
private
  def user_params
    params.require(:user).permit(:username,:first,:last,:age, :email, :password, :avatar)
  end
end
