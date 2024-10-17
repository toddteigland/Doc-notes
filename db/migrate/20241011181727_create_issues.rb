class CreateIssues < ActiveRecord::Migration[7.1]
  def change
    create_table :issues do |t|
      t.references :appointment, null: false, foreign_key: true
      t.string :description
      t.string :severity

      t.timestamps
    end
  end
end
