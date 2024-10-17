class CreateAppointmentIssues < ActiveRecord::Migration[7.1]
  def change
    create_table :appointment_issues do |t|
      t.integer :appointment_id, null: false
      t.integer :issue_id, null: false
      t.timestamps
    end

    add_index :appointment_issues, :appointment_id
    add_index :appointment_issues, :issue_id
  end
end
