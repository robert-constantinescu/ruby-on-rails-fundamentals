class CategoriesController < ApplicationController


  before_action :require_admin, except: [:index, :show]
  before_action :set_category, only: [:new]

  def new; end

  def show
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def create
    @category = Category.new(extract_params)
    if @category.save
      flash[:notice] = 'Category saved!'
      redirect_to category_path(@category)
    else
      render 'new'
    end
  end

  private

  def set_category
    @category = Category.new
  end

  def extract_params
    params.require(:category).permit(:name)
  end

  def require_admin
    unless logged_in? && current_user.admin?
      flash[:alert] = 'Only admin can create new categories'
      redirect_to categories_path
    end
  end

end
