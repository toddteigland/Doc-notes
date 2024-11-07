class RemoveAppointmentIdFromIssues < ActiveRecord::Migration[7.1]
  def change
    remove_column :issues, :appointment_id, :integer
  end
end
