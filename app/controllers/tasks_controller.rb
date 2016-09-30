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

    @task.mark_complete(params[:task][:complete])

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

    @task.mark_complete(params[:task][:complete])

    @task.save
  end

  def destroy
    tasks = Task.all
    @task = tasks.find(params[:id])

    @task.destroy

    redirect_to(action: 'index')
  end
end
