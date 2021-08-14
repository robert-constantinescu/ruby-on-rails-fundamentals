class PagesController < ApplicationController

  # render just means 'display something', you can also 'render' things like JSON, text, html etc(Google for more)
  # by convention, rails is going to expect a 'home.html.erb' template file
  def home
    redirect_to reports_path if logged_in?
  end

  def about; end

end
