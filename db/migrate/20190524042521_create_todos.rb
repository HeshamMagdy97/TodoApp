class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :title, null: false, default: ''
      t.string :description, null: false, default: ''
      t.string :todo_type, null: false
      t.integer :priority, default: 1
      t.date :due_date
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :todos, :due_date
    add_index :todos, :todo_type
  end
end
