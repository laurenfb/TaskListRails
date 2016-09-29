class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    tasks = Task.all
    @task = tasks.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @params = params
    @task = Task.new
    @task.title = params[:task][:title]
    @task.description = params[:task][:description]
    @task.complete = params[:task][:complete]
    @task.completed_at = Time.now
    @task.save
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
