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

  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy
    redirect_to(:back)
  end 


end 