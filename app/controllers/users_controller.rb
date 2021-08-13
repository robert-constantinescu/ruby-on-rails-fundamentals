class UsersController < ApplicationController


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


  private

  def whitelist_and_extract_user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
