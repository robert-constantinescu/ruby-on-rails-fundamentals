# the '<' stands for inherits or is a subclass of
class ReportsController < ApplicationController

  # this says that before the action from square_brackets, execute the 'find_report_from_id' method
  before_action :find_report_from_id, only: [:show, :edit, :update, :destroy]

  def show
    puts "params URL--  : #{params}"
    # only INSTANCE variables can be accessed in the view template
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
    # otherwise, due to security feature, the parameter will not be available for assignment
    @report = Report.new(whitelist_and_extract_report_params)
    @report.user = User.first #temporily code to be able to save reports

    if @report.save
      flash[:notice] = 'Article was created successfully'
      # what rails will do here, is to extract the report id from the @report and then use it to form the path=/reports/:id
      # redirect_to @report => will do the same redirection
      redirect_to report_path(@report)
    else
      render 'new' # if the save fails, render the 'new' template again
    end
  end

  def edit
  end

  def update
    if @report.update(whitelist_and_extract_report_params)
      flash[:notice] = 'Article was UPDATED successfully'
      redirect_to report_path(@report)
    else
      render 'edit'
    end
  end

  def destroy
    @report.destroy
    redirect_to reports_path
  end

  private

  def find_report_from_id
    @report = Report.find(params[:id])
  end

  def whitelist_and_extract_report_params
    # using the below syntax, we allow ruby to read the parameters from permit() method and assign them to the newly created object
    params.require(:report).permit(:title, :description)
  end

end
