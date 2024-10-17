class AddUserIdToIssues < ActiveRecord::Migration[7.1]
  def change
    add_column :issues, :user_id, :integer
    add_index :issues, :user_id
  end
end
