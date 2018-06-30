class TasksController < ApplicationController
  before_action :signed_in?

  def create
    @task = Task.create(task_params)
    list = List.find(params[:task][:list_id])
    redirect_to list_path(list)
  end

  def update
    @task = Task.find(params.require(:id))
    @task.update(task: params.require(:task))
    list = List.find(@task.list_id)
    redirect_to list_path(list)
  end

  def destroy
    @task = Task.find(params.require(:id))
    list = List.find(@task.list_id)
    @task.destroy
    redirect_to list_path(list)
  end

  private

  def task_id
    params.require(:task)
  end

  def task_params
    params.require(:task).permit(:task, :list_id)
  end

  def signed_in?
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
