class TasksController < ApplicationController
  include ApplicationHelper

  before_action(:find_task, {only: [:edit, :edit, :update] })


  def create
      @task = Task.create(task_params)
      @task.user_id = params[:user_id]
      @task.save
    flash[:notice] = "#{@task.title} has been added as a #{@task.t_type} Task."
    redirect_to(:back)
  end 

  def edit
  end 

  def update
    @task.update(task_params)
    redirect_to("/users/#{@task.user_id}" )
  end 

  def destroy
    @task.destroy
    redirect_to(:back)
  end 

  private 
  def task_params
    params.require(:task).permit(:title, :t_type, :notes, :due_date)
  end 

  def find_task
    @task = Task.find_by(id: params[:id])
  end 

end 