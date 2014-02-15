class MeetupController < ApplicationController
  
  def meetup_search
    @zipcode = params[:zipcode]
    @topic = params[:topic] 
    get_meetup
    render(:back)
  end 

  def list
  @from_meetup 
  zipcode = params[:zipcode]
  topic = params[:topic]
  get_meetup(zipcode, topic)
  render(:list)
  end 

  private
  def get_meetup(zipcode, topic)
    topic = topic.gsub(" ","+")
    meetup_api = MEETUP_API    
    @from_meetup = HTTParty.get("http://api.meetup.com/groups.json/?zip=#{zipcode}&text=#{topic}&order=members&key=#{meetup_api}")
    @from_meetup = @from_meetup["results"]
  end

end 