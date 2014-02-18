class TokensController < ApplicationController
  def create
    get_token  
    Token.create(
      expires_in: @token["expires_in"],
      access_token: @token["access_token"],
      user_id: params[:user_id]
      )
    redirect_to(:back)
  end

  # def get_auth
  #   consumer_key = LI_CONSUMER_KEY
  #   consumer_secret = LI_CONSUMER_SECRET
  #   "https://www.linkedin.com/uas/oauth2/authorization?response_type=code&client_id=#{consumer_key}%>&state=DCEEFWF45453sdffef424&redirect_uri=http://localhost:3000/users/#{session[:user_id]}/lilist"
  # end 

  def get_token
    consumer_key = LI_CONSUMER_KEY
    consumer_secret = LI_CONSUMER_SECRET
    @token = HTTParty.get("https://www.linkedin.com/uas/oauth2/accessToken?grant_type=authorization_code&code=#{session[:code]}&redirect_uri=http://localhost:3000/users/#{session[:user_id]}/lilist&client_id=#{consumer_key}&client_secret=#{consumer_secret}")
    binding.pry
  end

end 

