class GroupsController < ApplicationController
  include MeetupsearchHelper

  def index 
  end 

  def search
    search_by_type("group")
  end

end 