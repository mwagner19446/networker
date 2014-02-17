class TasksController < ApplicationController

  def create
    if params["task"].nil? ##From the Meetup Page
      Task.create(title: params["title"],
        user_id: params[:user_id],
        due_date: params[:due_date],
        t_type: params[:t_type])
    else ##From the Dashboard Form Field
      task = Task.create(task_params)
      task.user_id = params[:user_id]
      task.save
    end 
    redirect_to(:back)
  end 

  def edit
    @user = User.find_by(id: params[:user_id]) 
    @task = Task.find_by(id: params[:id])
  end 

  def update
    @task = Task.find_by(id: params[:id])
    @task.update(task_params)
    redirect_to("/users/#{@task.user_id}" )
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