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

    if @task.complete
      @task.completed_at = Time.now
    end

    @task.save
  end

  def edit
    tasks = Task.all
    @task = tasks.find(params[:id])
  end

  def update
    tasks = Task.all
    @task = tasks.find(params[:id])

    @task.title = params[:task][:title]
    @task.description = params[:task][:description]
    @task.complete = params[:task][:complete]

    if @task.complete
      @task.completed_at = Time.now
    end

    @task.save
  end

  def destroy
    tasks = Task.all
    @task = tasks.find(params[:id])

    @task.destroy
  end
end
