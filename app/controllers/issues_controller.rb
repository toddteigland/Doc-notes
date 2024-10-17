class IssuesController < ApplicationController
 
 def index
  @issues = current_user.issues.all
 end

 def new
  @issue = current_user.issues.new
 end

 def create
  @issue = current_user.issues.new(issue_params)
  if @issue.save
    redirect_to new_appointment_path, notice: 'Issue created.'
  else
    render :new
  end
 end

 private


 def issue_params
  params.require(:issue).permit(:issue_name)
 end

end
