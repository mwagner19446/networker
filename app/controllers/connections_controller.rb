class ConnectionsController < ApplicationController

  def create
    if params["connection"].nil?  ###From the Linked In List Page
      Connection.create(name: params[:name], 
        user_id: params[:user_id], 
        c_type: params[:c_type],
        photo_url: params[:picture_url])
    else  ### From the Dashboard Form Field
      con = Connection.create(connection_params) 
      con.user_id = params[:user_id]
      con.save
    end 
    redirect_to(:back)
  end 

  def edit
    @user = User.find_by(id: params[:user_id]) 
    @connection = Connection.find_by(id: params[:id])
  end 

  def update
    @connection= Connection.find_by(id: params[:id])
    @connection.update(connection_params)
    redirect_to("/users/#{@connection.user_id}")
  end 

  def destroy
    @connection = Connection.find_by(id: params[:id])
    @connection.destroy
    redirect_to(:back)
  end 

  private
  def connection_params
    params.require(:connection).permit(:name, :c_type)
  end 

end 