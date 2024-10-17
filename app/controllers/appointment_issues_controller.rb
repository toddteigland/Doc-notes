class AppointmentIssuesController < ApplicationController
  def new
    @appointment_issue = AppointmentIssue.new
  end

  def create
    @appointment = Appointment.find(params[:appointment_id])

    # Check if an existing issue is selected
    if params[:appointment_issue][:issue_id].present?
      issue = Issue.find(params[:appointment_issue][:issue_id])
      
      if @appointment.issues.include?(issue)
        redirect_to @appointment, alert: 'Issue already added to appointment.'
      else
        @appointment.issues << issue
        redirect_to @appointment, notice: 'Issue added successfully.'
      end
    # Check if a new issue description is provided
  elsif params[:appointment_issue][:new_issue_description].present?
    new_issue = Issue.new(
      description: params[:appointment_issue][:new_issue_description],
      severity: params[:appointment_issue][:severity],
      user_id: current_user.id,
      appointment_id: @appointment.id
    )
                      
      if new_issue.save
        @appointment.issues << new_issue
        redirect_to @appointment, notice: 'New issue added successfully.'
      else
        error_messages = new_issue.errors.full_messages.join(', ')
        redirect_to @appointment, alert: "Failed to add new issue: #{error_messages}"
      end
    else
      redirect_to @appointment, alert: 'Please select an existing issue or enter a new issue description.'
    end
  end
end
