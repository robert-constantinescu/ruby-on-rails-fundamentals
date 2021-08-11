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

  def new
    # we need to initiate the @report variable when we load the 'new' view, because we check if there are any errors on @reports
    # if @reports is not initiated, then it will be 'nil' and NilError will occur
    @report = Report.new
  end


  def create
    puts "create-params: #{params[:report]}"
    # using the below syntax, we allow ruby to read the parameters from permit() method and assign them to the newly created object
    # otherwise, due to security feature, the parameter will not be available for assignment
    @report = Report.new(params.require(:report).permit(:title, :description))

    if @report.save
    # what rails will do here, is to extract the report id from the @report and then use it to form the path=/reports/:id
    # redirect_to @report => will do the same redirection
      flash[:notice] = 'Article was created successfully'
      redirect_to report_path(@report)
    else
      render 'new' # if the save fails, render the 'new' template again
    end
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    if @report.update(params.require(:report).permit(:title, :description))
      flash[:notice] = 'Article was UPDATED successfully'
      redirect_to report_path(@report)
    else
      render 'edit'
    end
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to reports_path
  end

end
