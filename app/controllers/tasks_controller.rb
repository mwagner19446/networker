class TasksController < ApplicationController

  def create
    @task = params["task"]
    Task.create(t_type: @task["t_type"], title: @task["title"], notes: @task["notes"], user_id: params[:user_id])
    redirect_to(:back)
  end 

end 