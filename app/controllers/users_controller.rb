class UsersController < ApplicationController

  def new 
    @user = User.new
  end 

  def create
    @user = User.new(user_params)
    if @user.save
      session["user_id"]=@user.id
      redirect_to user_path(@user)
    else
      render(:new)
    end 
  end 

  def index
    @users = User.all
    render(:index)
  end 

  def edit
    @user = User.find_by(id: params[:id])
  end 

  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
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
    params.require(:user).permit(:name, :title, :email, :password, :password_confirmation)
  end 

   def authenticate
    unless logged_in?
      redirect_to login_path
    end
  end

  def authorize
    unless current_user == @user
      redirect_to login_path
    end
  end

end 