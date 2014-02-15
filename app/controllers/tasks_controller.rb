class TasksController < ApplicationController

  def create
    @task = params["task"]
    if @task.nil?
      Task.create(title: params["title"],user_id: params[:user_id])
    else 
      Task.create(t_type: @task["t_type"], title: @task["title"], notes: @task["notes"], user_id: params[:user_id])
    end 
    
    redirect_to(:back)
  end 

end 