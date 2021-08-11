# the '<' stands for inherits or is a subclass of
class ReportsController < ApplicationController

  def show
    puts "params URL--  : #{params}"
    # only INSTANCE variables can be accessed in the view template
    @report = Report.find(params[:id])
  end

  def index
    @reports = Report.all
  end
end
