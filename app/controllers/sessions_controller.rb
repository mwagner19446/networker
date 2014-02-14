class SessionsController < ApplicationController
  def new
  end 
  def create
  
    ##authenticate:  check whether this information matches what is in the database
    ##If so, go to the user page...
    ##If not.. Destroy
  
    user = User.find_by(email: params[:email])
    if user && (user.password == (params[:password]) )
      session[:user_id] = user.id
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