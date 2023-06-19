require 'faker'

class TasksController < ApplicationController
  def index
    @quote = Faker::Games::WorldOfWarcraft.quote
    @tasks = Task.all.order(created_at: :desc)
  end

  def create
    @task = Task.create(task_params)
  end

  def update
    @task = Task.find(params[:id]).update(task_params)
  end

  private

  def task_params
    params.require(:task).permit(:task, :done)
  end
end
