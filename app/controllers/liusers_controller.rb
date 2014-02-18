class LiusersController < ApplicationController
  
  before_action(:get_linkedin, {only: [:list] })

  def create
  end   

  def list
    if session[:connections].nil?
      session[:connections] = []
    end 

    unless params[:code].nil?
      session[:code]=params[:code]
    end 
  
    @liadds = Liuser.where(id: session[:connections])
    @liusers = Liuser.all
    render(:list)
  end 

  def connections
    session[:connections] << params[:user] 
    redirect_to(:back)
  end 

  private

  def get_linkedin
    access_token = Token.find_by(user_id: params[:user_id])
    path = "/v1/people/~/connections?format=json"
    binding.pry
    @response = JSON(access_token.get(path).body)
    @response = @response["values"]

  end



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