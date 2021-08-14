class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]


  def show; end

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

  def edit; end

  def update
    if @user.update(whitelist_and_extract_user_params)
      flash[:notice] = 'Account was successfully updated'
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    User.destroy(@user.id)
    session[:user_id] = nil
    flash[:notice] = 'Account deleted'
    redirect_to reports_path
  end


  private

  def whitelist_and_extract_user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:alert] = 'You can only edit your own profile'
      redirect_to @user
    end
  end
end
