class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(username: params[:session][:username])
  	if user and user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
  	else
  		flash[:danger] = "Invalid username and password combination"
  		render "new"
  	end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
