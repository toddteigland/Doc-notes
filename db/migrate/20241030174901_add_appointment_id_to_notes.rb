class AddAppointmentIdToNotes < ActiveRecord::Migration[7.1]
  def change
    add_column :notes, :appointment_id, :integer, null: false
    add_index :notes, :appointment_id
    add_foreign_key :notes, :appointments
  end
end
