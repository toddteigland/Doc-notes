class NotesController < ApplicationController

def index
  @notes = current_user.notes.all
end
# ------------------------------------------------------------------------------------------------

def new
  @note = Note.new(note_params)
  @note.issue_id = params[:issue_id]
  @note.appointment_id = params[:appointment_id] 

end
def create
  @note = Note.new(note_params)
  if @note.save
    redirect_to appointments_path, notice: 'Note created.'
  else
    flash.now[:alert] = 'There was an issue saving the note.'
    render :new
  end
end
# ------------------------------------------------------------------------------------------------
def edit
  @note = Note.find(params[:id])
end

def update
  respond_to do |format|
    if @note = Note.find(note_params)
      format.html { redirect_to appointment_path, notice: "Appointment Note has been changed."}
    else
      format.html { render :edit }
    end
  end
end
# ------------------------------------------------------------------------------------------------


private

def note_params
 params.require(:note).permit(:content, :issue_id, :appointment_id)
end


end