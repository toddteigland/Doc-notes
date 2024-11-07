class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:edit, :update, :destroy]
  before_action :set_issues, only: [:new, :edit]


  def index
    @appointments = current_user.appointments.all
  end

  def show
    @appointment = Appointment.find(params[:id])
    @issues = @appointment.issues.includes(:notes) # This will limit notes to each issue
    @appointment_issues = @appointment.appointment_issues # Issues already associated with this appointment
    @notes = @appointment.notes.includes(:issue) # Notes associated with this appointment
    @note = Note.new(appointment_id: @appointment.id)
  end
  # ------------------------------------------------------------------------------------------------

  def new
    @appointment = current_user.appointments.new
  end

  def create
    @appointment = current_user.appointments.new(appointment_params)
    
    if @appointment.save
      # Create or associate issue if provided
      if params[:appointment][:issue_id].present?
        AppointmentIssue.create(appointment_id: @appointment.id, issue_id: params[:appointment][:issue_id])
      end
      
      # Create a note if content is provided
      if params[:appointment][:note_content].present?
        note = Note.create(content: params[:appointment][:note_content], issue_id: params[:appointment][:issue_id])
      end
      
      redirect_to appointment_path(@appointment), notice: 'Appointment created successfully.'
    else
      puts @appointment.errors.full_messages # Log errors to the console
      render :new
    end
  end
  # ------------------------------------------------------------------------------------------------

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    respond_to do |format|
      if @appointment = Appointment.find(appointment_params)
        format.html { redirect_to appointment_path, notice: "Appointment has been changed."}
      else
        format.html { render :edit }
      end
    end
  end
  # ------------------------------------------------------------------------------------------------

  def destroy
    @appointment.destroy!
    respond_to do |format|
      format.html {redirect_to appointment_path, notice: "Appointment has been deleted!"}
    end
  end
  # ------------------------------------------------------------------------------------------------

  private
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end
  def appointment_params 
    params.require(:appointment).permit(:date, :doctor_name, :issue_id)
  end
  def set_issues
    @issues = current_user.issues.all
   end
end
