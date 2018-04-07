class CreateTodoItems < ActiveRecord::Migration[5.1]
  def change
    create_table :todo_items do |t|
      t.string :title
      t.references :todo_list, foreign_key: true
      t.datetime :scheduled_to
      t.timestamps
    end
  end
end
