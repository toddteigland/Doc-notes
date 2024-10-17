class CreateNotes < ActiveRecord::Migration[7.1]
  def change
    create_table :notes do |t|
      t.integer :issue_id, null: false
      t.integer :appointment_id, null: false
      t.text :content
      t.timestamps
    end

    add_index :notes, :issue_id
    add_index :notes, :appointment_id
  end
end
