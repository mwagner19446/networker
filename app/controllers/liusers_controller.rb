class LiusersController < ApplicationController
  before_action(:retrieve_token, {only: [:index, :search] })
  before_action(:add_token, {only: [:index] })
  
  def index
  end 

  def create
  end   

  def search
    @response = HTTParty.get("https://api.linkedin.com/v1/people/~/connections?format=json&oauth2_access_token=#{@token}")
    @response = @response["values"]

    @response.each do |liuser|
      if Liuser.find_by(linkedin_id: liuser["id"]).nil?
        Liuser.create(linkedin_id: liuser["id"], first_name: liuser["firstName"], last_name: liuser["lastName"], headline: liuser["headline"], industry: liuser["industry"], picture_url: liuser["pictureUrl"] ) 
        Connection.create(name: (liuser["firstName"]+" "+liuser["lastName"]), c_type: "NONE", user_id: session[:user_id], photo_url: liuser["pictureUrl"] )
      end 
    end 

    render(:search)
  end 

  private

  def add_token
    if params["code"]
      consumer_key = LI_CONSUMER_KEY
      consumer_secret = LI_CONSUMER_SECRET
      @token = HTTParty.get("https://www.linkedin.com/uas/oauth2/accessToken?grant_type=authorization_code&code=#{params["code"]}&redirect_uri=http://localhost:3000/users/#{session["user_id"]}/liusers&client_id=#{consumer_key}&client_secret=#{consumer_secret}" )
      

      Token.create(
      access_date: Time.now,
      expires_in: Time.now + @token["expires_in"],
      access_token: @token["access_token"],
      user_id: params[:user_id]
      )  
    end
  end 

  def retrieve_token
    @token = Token.where("user_id = ? AND expires_in > ?",  params[:user_id], Time.now)
    @token = @token.last
    if !@token.nil?
      @token = @token.access_token
    end 
  end

end 