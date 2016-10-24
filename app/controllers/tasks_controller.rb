class TasksController < ApplicationController
  before_action :current_task, only: [:show, :edit, :update, :destroy]
  before_action :users_tasks, only: [:index, :show, :edit]
  before_action :logged_in
  before_action :check_permission, only: [:show, :edit]

  def index
    @complete_tasks = []
    @incomplete_tasks = []

    @tasks.each do |task|
      if task.complete?
        @complete_tasks << task
      else
        @incomplete_tasks << task
      end
    end 
  end

  def show ;  end

  def new
    @task = Task.new
    @path = "create"
  end

  def create
    @task = Task.new
    @task.title = params[:task][:title]
    @task.description = params[:task][:description]

    @task.mark_complete(params[:task][:complete])
    @task.user_id = session[:user_id]

    if @task.save
      flash[:notice] = "task successfully saved!"
      redirect_to index_path
    else
      flash[:notice] = "your task couldn't save. please try again."
      redirect_to new_path
    end
  end

  def edit
    @path = "update"
    @method = :put
  end

  def update
    @task.title = params[:task][:title]
    @task.description = params[:task][:description]
    @task.mark_complete(params[:task][:complete])
    @task.save
  end

  def destroy
    @task.destroy
    redirect_to(action: 'index')
  end

  private
  def users_tasks
    @tasks = Task.where(user_id: session[:user_id])
  end

  def current_task
    @task = Task.find_by(id: params[:id])
  end

  def logged_in
    user = User.find_by(id: session[:user_id])
    if user.nil?
      flash[:notice] = "Please log in to have access to the page you requested"
      redirect_to root_path
    end
  end

  def check_permission
    if !@tasks.include?(@task)
      flash[:notice] = "you do not have permission to access the requested page. instead, here are your tasks!"
      redirect_to index_path
    end
  end

end
