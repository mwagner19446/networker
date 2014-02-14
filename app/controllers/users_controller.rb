class UsersController < ApplicationController
  before_action(:get_linkedin, { only: [:show] })


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
    @response
    binding.pry
    render(:show)
  end 

  private
  def get_linkedin
    
    consumer_key = '77iylsiyydidqo'
    consumer_secret = 'FBDMvnVorrbCvzCG'
    token = 'ee027221-c1b6-412e-a4e1-595ed4b1c821'
    token_secret = 'f1594d8b-034e-4250-b8cf-e7b89b835053'
    
    api_host = 'api.linkedin.com'
  
    consumer = ::OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
    access_token = ::OAuth::AccessToken.new(consumer, token, token_secret)
    
    path = "/v1/people/~/connections?format=json"
    @response = JSON(access_token.get(path).body)
  end



end 