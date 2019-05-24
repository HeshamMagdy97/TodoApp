class Todo < ApplicationRecord
  belongs_to :user
  validates :priority, inclusion: 1..5
  validates_presence_of :priority, :title, :description, :user_id, :todo_type
end
