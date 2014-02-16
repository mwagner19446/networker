class TasksController < ApplicationController

  def create
    if params["task"].nil? ##From the Meetup Page
      Task.create(title: params["title"],
        user_id: params[:user_id])
    else ##From the Dashboard Form Field
      task = Task.create(task_params)
      task.user_id = params[:user_id]
      task.save
    end 
    redirect_to(:back)
  end 

  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy
    redirect_to(:back)
  end 

  private 
  def task_params
    params.require(:task).permit(:name, :t_type, :notes)
  end 

end 