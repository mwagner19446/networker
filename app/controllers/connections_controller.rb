class ConnectionsController < ApplicationController

  def create
    @connection = params["connection"]
    Connection.create(c_type: @connection["c_type"], name: @connection["name"],user_id: params[:user_id])
    redirect_to(:back)
  end 


end 