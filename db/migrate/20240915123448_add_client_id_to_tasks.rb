class AddClientIdToTasks < ActiveRecord::Migration[7.2]
  def change
    add_column :tasks, :client_id, :integer, null: true  # Adjust null: true/false as needed
    add_foreign_key :tasks, :clients  # Optionally add this if you want a foreign key constraint
  end
end
