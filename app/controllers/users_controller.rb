class UsersController < ApplicationController

  def index
    @users = User.all
    render(:index)
  end 

  def show
    @user = User.find_by(id: params[:id])
    @tasks = Task.where(user_id: params[:id])
    @connections = Connection.where(user_id: params[:id])
    @task = Task.new
    @connection = Connection.new
    render(:show)
  end 

end 