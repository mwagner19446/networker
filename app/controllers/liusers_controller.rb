class LiusersController < ApplicationController
  
  def create
    if params[:code].nil?
      get_auth
    end 
    get_token
    redirect_to(:back)
  end   

  def list
  @liusers = Liuser.all
  render(:list)
  end 

  private
  ### Previously used with no authentication. 
  # def get_linkedin
  #   consumer_key = LI_CONSUMER_KEY
  #   consumer_secret = LI_CONSUMER_SECRET
  #   token = LI_TOKEN
  #   token_secret = LI_TOKEN_SECRET
    
  #   api_host = 'api.linkedin.com'
  
  #   consumer = ::OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
  #   access_token = ::OAuth::AccessToken.new(consumer, token, token_secret)
    
  #   path = "/v1/people/~/connections?format=json"
  #   @response = JSON(access_token.get(path).body)
  #   @response = @response["values"]
  # end

  def get_auth
    @consumer_key = LI_CONSUMER_KEY
    @consumer_secret = LI_CONSUMER_SECRET
    redirect_to("https://www.linkedin.com/uas/oauth2/authorization?response_type=code&client_id=<%=consumer_key%>&state=DCEEFWF45453sdffef424&redirect_uri=http://localhost:3000/users/<%=params[:id]%>/lilist") and return 
  end 

  def get_token
    @token = HTTParty.get("https://www.linkedin.com/uas/oauth2/accessToken?grant_type=authorization_code&code=#{params[:code]}&redirect_uri=http://localhost:3000/users/#{session[:user_id]}/lilist&client_id=#{@consumer_key}&client_secret=#{@consumer_secret}")
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