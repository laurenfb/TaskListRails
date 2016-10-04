class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
    @path = "create"
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
    @task = Task.find(params[:id])
    @path = "update"
    @method = :put
  end

  def update
    @task = Task.find(params[:id])

    @task.title = params[:task][:title]
    @task.description = params[:task][:description]

    @task.mark_complete(params[:task][:complete])

    @task.save
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to(action: 'index')
  end

  def task
    @task ||= Task.find(params[:id])
  end
end
