module MeetupsearchHelper

  def search_by_type(type)
    zipcode = params[:zipcode]
    topic = params[:topic]
    meetup_api = MEETUP_API  

    if type == "event"
      url = "http://api.meetup.com/2/open_events?status=upcoming&radius=25.0&and_text=False&limited_events=False&text=#{topic}&desc=False&offset=0&format=json&zip=#{zipcode}&page=20&key=#{meetup_api}"
    elsif type == "group"
      url = "http://api.meetup.com/groups.json/?zip=#{zipcode}&text=#{topic}&order=members&key=#{meetup_api}"
    end 

      
    @event_meetup = HTTParty.get(url)
    @event_meetup = @event_meetup["results"]
  end
  
end 