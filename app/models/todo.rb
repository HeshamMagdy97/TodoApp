class Todo < ApplicationRecord
  belongs_to :user
  validates :priority, inclusion: 1..5
  validates_presence_of :priority, :title, :description, :user_id, :todo_type
  validates :todo_type,
            inclusion: { in: %w[task event],
                         message: "#{value} is not a valid type" }

  validate :valide_due_date

  def happened_at_is_valid_datetime
    if due_date.present?
      errors.add(:due_date, 'must be a valid datetime it cant be at past') if (due_date < Date.today)
    end
  end
## add location

  def self.user_todos(user_id)
    where(user_id: user_id)
  end

  def can_mange?(user)
    user.id == user_id
  end
end
