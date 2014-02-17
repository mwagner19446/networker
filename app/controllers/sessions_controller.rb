class SessionsController < ApplicationController
  def new
  end 
  
  def create
    user = User.find_by(email: params[:email])
    if user && ( user.authenticate(params[:password])  )
      session[:user_id] = user.id
      session[:superuser] = user.superuser
      redirect_to(user_path(user)) 
    else
      @message = "This email and password combination does not exist"
      render(:new)
    end 
  end 
  
  def destroy
      session[:user_id] = nil
      redirect_to("/")
  end 
end 