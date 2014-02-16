class MeetupController < ApplicationController

  def group
  @from_meetup 
  zipcode = params[:zipcode]
  topic = params[:topic]
    unless topic.nil? 
      get_group(zipcode, topic)
    end 
  end 

  def upcoming
  @upcoming_meetup
  zipcode = params[:zipcode]
  topic = params[:topic]
    unless topic.nil? 
      get_upcoming(zipcode, topic)
    end 
  end 

  private
  def get_group(zipcode, topic)
    topic = topic.gsub(" ","+")
    meetup_api = MEETUP_API    
    @group_meetup = HTTParty.get("http://api.meetup.com/groups.json/?zip=#{zipcode}&text=#{topic}&order=members&key=#{meetup_api}")
    @group_meetup = @from_meetup["results"]
  end

  def get_upcoming(zipcode, topic)
    topic = topic.gsub(" ","+")
    meetup_api = MEETUP_API    
    @upcoming_meetup = HTTParty.get("http://api.meetup.com/2/open_events?status=upcoming&radius=25.0&and_text=False&limited_events=False&text=#{topic}&desc=False&offset=0&format=json&zip=#{zipcode}&page=20&key=#{meetup_api}")
    @upcoming_meetup = @upcoming_meetup["results"]
  end

end 