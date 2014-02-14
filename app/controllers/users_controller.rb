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
    @connections = Connection.where(user_id: params[:id])
    @task = Task.new
    @connection = Connection.new
    @from_meetup
    render(:show)
  end 

  def get_meetup(zipcode, keyword)
    meetup_api = MEETUP_API    
    @from_meetup = HTTParty.get("http://api.meetup.com/groups.json/?zip=#{zipcode}&topic=#{keyword}&order=members&key=#{}{meetup_api}")
  end

  def user_params
    params.require(:user).permit(:name, :title, :password, :email)
  end 

end 