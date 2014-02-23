class LiusersController < ApplicationController
  before_action(:retrieve_token, {only: [:index, :search] })
  before_action(:get_token, {only: [:index] })
  
  def index
  end 

  def create
  end   

  def search
    @response = HTTParty.get("https://api.linkedin.com/v1/people/~/connections?format=json&oauth2_access_token=#{@token}")
    @response = @response["values"]
    render(:search)
  end 

  private

  def add_token
    if params["code"]
      consumer_key = LI_CONSUMER_KEY
      consumer_secret = LI_CONSUMER_SECRET
      @token = HTTParty.get("https://www.linkedin.com/uas/oauth2/accessToken?grant_type=authorization_code&code=#{params["code"]}&redirect_uri=http://localhost:3000/users/#{session["user_id"]}/liusers&client_id=#{consumer_key}&client_secret=#{consumer_secret}" )
    end  
      Token.create(
      access_date: Time.now,
      expires_in: Time.now + @token["expires_in"],
      access_token: @token["access_token"],
      user_id: params[:user_id]
      )  
  end 

  def retrieve_token
    @token = Token.where("user_id = ? AND expires_in > ?",  params[:user_id], Time.now)
    @token = @token.last
    if !@token.nil?
      @token = @token.access_token
    end 
  end

end 