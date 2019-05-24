class Todo < ApplicationRecord
  belongs_to :user
  validates :priority, inclusion: 1..5
  validates_presence_of :priority, :title, :description, :user_id, :todo_type

  def self.user_todos(user_id)
    where(user_id: user_id)
  end
end
