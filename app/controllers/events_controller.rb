class EventsController < ApplicationController
  def index
  end 

  def search
    zipcode = params[:zipcode]
    topic = params[:topic]
    # topic = topic.gsub(" ","+")
    meetup_api = MEETUP_API    
    @event_meetup = HTTParty.get("http://api.meetup.com/2/open_events?status=upcoming&radius=25.0&and_text=False&limited_events=False&text=#{topic}&desc=False&offset=0&format=json&zip=#{zipcode}&page=20&key=#{meetup_api}")
    @event_meetup = @event_meetup["results"]
  end 

end 