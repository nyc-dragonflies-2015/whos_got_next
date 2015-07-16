class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find(params[:id])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :email, :phone_number)
  end
end
