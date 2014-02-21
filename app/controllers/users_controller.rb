class UsersController < ApplicationController
  include FinduserHelper
  
  before_action(:find_user, {only: [:edit, :update, :show, :destroy] })

  def new 
    @user = User.new
    render(:new)
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
  end 

  def update
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end 

  def destroy
    @user.destroy
    redirect_to(:back)
  end 

  def show
    @tasks = Task.where(user_id: params[:id])
    @tasks = @tasks.order(:due_date)
    @connections = Connection.where(user_id: params[:id])
    @task = Task.new
    @connection = Connection.new
    render(:show)
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

private
  def user_params
    params.require(:user).permit(:name, :title, :email, :password, :password_confirmation)
  end 
 

end 