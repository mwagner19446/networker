class ConnectionsController < ApplicationController
  before_action(:find_connection, {only: [:edit, :destroy] })


  def create
      @connection = Connection.create(connection_params) 
      @connection.user_id = params[:user_id]
      @connection.save
    
    flash[:notice] = "#{@connection.name} has been added as a #{@connection.c_type}"
    redirect_to(:back)
  end 

  def edit
    @user = User.find_by(id: params[:user_id]) 
  end 

  def update
    @connection.update(connection_params)
    redirect_to("/users/#{@connection.user_id}")
  end 

  def destroy
    @connection.destroy
    redirect_to(:back)
  end 

  private
  def connection_params
    params.require(:connection).permit(:name, :c_type)
  end 

  def find_connection 
    @connection = Connection.find_by(id: params[:id])
  end 

end 