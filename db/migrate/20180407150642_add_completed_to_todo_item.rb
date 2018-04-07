class AddCompletedToTodoItem < ActiveRecord::Migration[5.1]
  def change
    add_column :todo_items, :completed, :boolean, default: :false
  end
end
