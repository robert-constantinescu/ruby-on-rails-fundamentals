class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]


  def show
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(whitelist_and_extract_user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Successfully Signed Up #{@user.username}!  Welcome to the app! "
      redirect_to reports_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(whitelist_and_extract_user_params)
      flash[:notice] = 'Account was successfully updated'
      redirect_to user_path(@user)
    else
      render 'edit'
    end

  end


  private

  def whitelist_and_extract_user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
