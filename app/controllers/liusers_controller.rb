class LiusersController < ApplicationController

  before_action(:get_token, {only: [:list] })

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
    @token = Token.where(user_id: params[:user_id])
    @token = @token.where.not(expires_in: nil)
    @token = @token.last
    @token = @token.access_token
  end 
 
end 