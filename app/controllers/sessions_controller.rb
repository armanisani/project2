class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({email: params[:email]})
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "Successfully logged in, #{@user.email}"
      redirect_to root_path(@user)
    else
      flash[:failure] = "Oops, something went wrong. Try again or give up on life"
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
