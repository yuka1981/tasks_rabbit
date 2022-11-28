# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :find_task, only: %i[show edit update destroy]

  def index
    if params[:category].blank?
      @tasks = Task.all.order(created_at: :desc)
    else
      @category_id = Category.find_by(name: params[:category])&.id
      @tasks = Task.where(category_id: @category_id).order(craeted_at: :desc)
    end
  end

  def show; end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(tasks_params)

    if @task.save
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @task.update(tasks_params)
      redirect_to take_path(@task)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy

    redirect_to root_path
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def tasks_params
    params.require(:task).permit(:title, :description, :company, :url, :category_id)
  end
end
