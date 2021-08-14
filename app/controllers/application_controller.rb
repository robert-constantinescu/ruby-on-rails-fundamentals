class ApplicationController < ActionController::Base


  # def hello
  #   # render just means 'display something', you can also 'render' things like JSON, text, html etc(Google for more)
  #   render html: 'Test'
  # end


  # if we reference the methods with 'helper_method' they will be available in the views also
  helper_method :current_user, :logged_in?

  def current_user
    # this is called memoization,
    #  ' ||= ' => is a common Ruby idiom: it assigns the value only if it is not already set.
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # !! => turn the variable into a boolean
    !!current_user
  end

  def require_user
    if logged_in?
      flash[:alert] = 'You must be logged in to perform that action'
      redirect_to login_path
    end
  end

end
