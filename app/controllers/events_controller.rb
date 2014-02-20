class EventsController < ApplicationController
  include MeetupsearchHelper

  def index
  end 

  def search
    search_by_type("event")
  end 

end 