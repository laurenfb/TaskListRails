class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @tasks = Task.all
    @current_task = nil

    @tasks.each do |task|
      number = params[:id].to_i
      if task[:id] == number
        @current_task = task
      end
    end
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
