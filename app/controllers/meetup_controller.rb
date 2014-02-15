class MeetupController < ApplicationController

  def list
  @from_meetup 
  zipcode = params[:zipcode]
  topic = params[:topic]
    binding.pry
    unless topic.nil? 
      get_meetup(zipcode, topic)
    end 
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