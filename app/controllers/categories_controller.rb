class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:index, :show, :new, :edit]
  
  def index
  end

  def show
    user_not_authorized(@category)
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      redirect_to categories_path, notice: "Yay! You've taken the first step towards productivity by successfully creating a category! 🥳"
    else
      render :new
    end
  end

  def edit
    user_not_authorized(@category)
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: "Way to go! You've boosted productivity by editing a category! 🫰"
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: "Awesome! You've made a decisive move in boosting productivity by successfully deleting a category! 🤟"
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def user_not_authorized(category)
    unless category.user == current_user
      redirect_to categories_path, alert: "Oops! The category doesn't exist from your list. 👻"
    end
  end

  def set_categories
    @categories = current_user.categories
  end

end
