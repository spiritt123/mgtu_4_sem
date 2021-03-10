class SessionsController < ApplicationController
  def new
  end  
  
  def create
    user = User.find_by_iduser(params[:iduser])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to home_index_url, notice: "Logged in!"
    else
      flash.now[:alert] = "Id or password is invalid"
      render "new"
    end
  end  
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
