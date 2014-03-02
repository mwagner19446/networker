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
      session[:message] = "This email and password combination does not exist"
      session[:email] = params[:email]
      redirect_to(:back)
    end 
  end 
  
  def superuser
    if session[:superuser_name].nil?
      @superuser = User.find_by(id: session[:user_id])  
      session[:superuser_name] = @superuser.name
    end 
    @user = User.find_by(id: params[:user_id])
    session[:user_id] = @user.id
    
    redirect_to(user_path(@user))
  end 

  def update
  end 

  def destroy
    session[:user_id] = nil
    session[:superuser] = nil
    session[:superuser_name] = nil
    session[:message] = nil
    session[:email] = nil
    redirect_to("/")
  end 
end 