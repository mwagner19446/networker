class UsersController < ApplicationController

  def new 
    @user = User.new
  end 

  def create
    @user = User.create(user_params)
    redirect_to user_path(@user)
  end 

  def index
    @users = User.all
    render(:index)
  end 

  def show
    @user = User.find_by(id: params[:id])
    @tasks = Task.where(user_id: params[:id])
    @tasks = @tasks.order(:due_date)
    @connections = Connection.where(user_id: params[:id])
    @task = Task.new
    @connection = Connection.new
    render(:show)
  end 

  def user_params
    params.require(:user).permit(:name, :title, :password, :email)
  end 

end 