class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(whitelist_and_extract_user_params)
    if @user.save
      flash[:notice] = "Successfully Signed Up #{@user.username}!  Welcome to the app! "
      redirect_to reports_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(whitelist_and_extract_user_params)
      flash[:notice] = 'Account was successfully updated'
      redirect_to reports_path
    else
      render 'edit'
    end

  end


  private

  def whitelist_and_extract_user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
