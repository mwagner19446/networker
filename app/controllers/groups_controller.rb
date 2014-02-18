class GroupsController < ApplicationController

  def index
  @group_meetup
  zipcode = params[:zipcode]
  topic = params[:topic]
    unless topic.nil? 
      search(zipcode, topic)
    end 
  end 

  def search
    zipcode = params[:zipcode]
    topic = params[:topic]
    topic = topic.gsub(" ","+")
    meetup_api = MEETUP_API    
    @group_meetup = HTTParty.get("http://api.meetup.com/groups.json/?zip=#{zipcode}&text=#{topic}&order=members&key=#{meetup_api}")
    @group_meetup = @group_meetup["results"]
  end

end 