class ConnectionsController < ApplicationController

  def create
    @connection = params["connection"]
    if @connection.nil? 
      Connection.create(name: params[:name], user_id: params[:user_id])
    else
      Connection.create(c_type: @connection["c_type"], name: @connection["name"],user_id: params[:user_id])
    end 
    redirect_to(:back)
  end 

  def destroy
    @connection = Connection.find_by(id: params[:id])
    @connection.destroy
    redirect_to(:back)
  end 

end 