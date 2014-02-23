class LiusersController < ApplicationController
  before_action(:add_token, {only: [:index] })
  before_action(:get_token, {only: [:index] })
  
  def index
  end 

  def create
  end   

  def search
    get_token
    @response = HTTParty.get("https://api.linkedin.com/v1/people/~/connections?format=json&oauth2_access_token=#{@token}")
    @response = @response["values"]
    render(:search)
  end 

  private

  def get_token
    @token = Token.where("user_id = ? AND expires_in > ?",  params[:user_id], Time.now)
    # @token = @token.where.not(expires_in: nil)
    @token = @token.last
    if !@token.nil?
      @token = @token.access_token
    end 
  end 

  def add_token
    if params["code"]
      Token.create(
      access_date: Time.now,
      expires_in: Time.now + 10.days,
      access_token: params["code"],
      user_id: params[:user_id]
      )
    end 
  end 

end 