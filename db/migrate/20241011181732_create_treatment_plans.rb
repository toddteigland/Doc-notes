class CreateTreatmentPlans < ActiveRecord::Migration[7.1]
  def change
    create_table :treatment_plans do |t|
      t.references :note, null: false, foreign_key: true
      t.text :description
      t.string :frequency
      t.datetime :start_date

      t.timestamps
    end
  end
end
