require 'rails_helper'

RSpec.describe Todo, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:priority) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:todo_type) }
  it { should validate_inclusion_of(:priority).in_range(1..5) }
end
