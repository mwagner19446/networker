class LiusersController < ApplicationController
  
  # before_action(:get_linkedin, {only: [:list] })

  # before_action(:user_linkedin, {only: [:list] })

  before_action(:get_token, {only: [:list] })


  def index
  end 

  def create
  end   

  def list
    # @response = Liuser.all
  end 

  def search
    @response = HTTParty.get("https://api.linkedin.com/v1/people/~/connections?format=json&oauth2_access_token=#{@token}")
    @response = @users["values"]
    render(:search)
  end 

  private

  # def get_linkedin
  #   access_token = Token.find_by(user_id: params[:user_id])
  #   path = "/v1/people/~/connections?format=json"
  #   @response = JSON(access_token.get(path).body)
  #   @response = @response["values"]

  # end

  #   def get_linkedin
  #   consumer_key = LI_CONSUMER_KEY
  #   consumer_secret = LI_CONSUMER_SECRET
  #   token = LI_TOKEN
  #   token_secret = LI_TOKEN_SECRET
    
  #   api_host = 'api.linkedin.com'
  
  #   consumer = ::OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
  #   access_token = Token.find_by(user_id: params[:user_id])
    
  #   path = "/v1/people/~/connections?format=json"
  #   @response = JSON(access_token.get(path).body)
  #   @response = @response["values"]
  # end 

  def get_token
    @token = Token.find_by(user_id: params[:user_id])
    @token = @token.access_token
  end 

  def user_linkedin
    get_token
    @response = HTTParty.get("https://api.linkedin.com/v1/people/~/connections?format=json&oauth2_access_token=#{@token}")
    @response = @users["values"]
    render(:list)
  end 


  ### Previously used with no authentication. 
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

   
  def add_contacts
    # @contacts.each do |response|
    #   Liuser.create(:linkedin_id response["id"], :first_name response["firstName"], :last_name response["lastName"], 
    #     :headline response["headline"], 
    #     :industry response["industry"], 
    #     :picture_url response["pictureUrl"])
    # end 

  end 

end 