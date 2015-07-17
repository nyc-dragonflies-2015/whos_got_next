class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: user_params[:username])
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      flash[:notice] = ["Logged in successfully"]
      redirect_to root_path
    else
      flash[:notice] = ["Something went wrong"]
      redirect_to :back
    end
  end

  def destroy
    flash[:notice] = ["You have logged out"]
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :email, :phone_number)
  end
end
