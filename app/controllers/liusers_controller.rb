class LiusersController < ApplicationController
  
  def create
    @code = params[:code]
    get_contacts
    redirect_to(:back)
  end   

  def list
  @liusers = Liuser.all
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

  def get_contacts
    consumer_key = LI_CONSUMER_KEY
    consumer_secret = LI_CONSUMER_SECRET
    @token = HTTParty.get("https://www.linkedin.com/uas/oauth2/accessToken?grant_type=authorization_code&code=#{params[:code]}&redirect_uri=http://localhost:3000/users/#{session[:user_id]}/lilist&client_id=#{consumer_key}&client_secret=#{consumer_secret}")
    binding.pry
  end 
  def add_contacts
    # @contacts.each do |response|
    #   Liuser.create(:linkedin_id response["id"], :first_name response["firstName"], :last_name response["lastName"], 
    #     :headline response["headline"], 
    #     :industry response["industry"], 
    #     :picture_url response["pictureUrl"])
    # end 

  end 


end 