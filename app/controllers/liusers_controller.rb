class LiusersController < ApplicationController
  before_action(:get_linkedin, { only: [:list] })
  
  def list
  render(:list)
  end 

  private
  def get_linkedin
    consumer_key = LI_CONSUMER_KEY
    consumer_secret = LI_CONSUMER_SECRET
    token = LI_TOKEN
    token_secret = LI_TOKEN_SECRET
    
    api_host = 'api.linkedin.com'
  
    consumer = ::OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
    access_token = ::OAuth::AccessToken.new(consumer, token, token_secret)
    
    path = "/v1/people/~/connections?format=json"
    @response = JSON(access_token.get(path).body)
    @response = @response["values"]
  end

end 