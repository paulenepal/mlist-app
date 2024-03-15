class TasksController < ApplicationController
  before_action :set_category, only: [:new, :create]
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_categories # for the side nav

  def show
    user_not_authorized(@task)
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    @task.category = @category

    if @task.save
      redirect_to category_path(@category), notice: "Whoopee! You've just created a new task! 🎉"
    else
      render :new
    end
  end

  def edit
    user_not_authorized(@task)
  end

  def update
    if @task.update(task_params)
      redirect_to category_path(@task.category), notice: "You've boosted productivity by editing your task! 🙌"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to category_path(@task.category), notice: "Awesome! You've made a decisive move in boosting productivity by successfully deleting a task! 🤟"
  end

  def today
    @tasks_today = current_user.tasks.today
  end

  def completed
    @tasks_completed = current_user.tasks.completed
  end

  def overdue
    @tasks_overdue = current_user.tasks.overdue
  end

  def upcoming
    @tasks_upcoming = current_user.tasks.upcoming
  end


  private

  def task_params
    params.require(:task).permit(:name, :description, :due_date, :completed)
  end

  def set_category
    @category = current_user.categories.find(params[:category_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def user_not_authorized(task)
    unless task.user == current_user
      redirect_to categories_path, alert: "Oops! The task you're trying to access doesn't exist from you list. 👻"
    end
  end

  def set_categories
    @categories = current_user.categories
  end

end