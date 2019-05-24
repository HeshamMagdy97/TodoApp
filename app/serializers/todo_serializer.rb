class TodoSerializer < ActiveModel::Serializer
  attributes *Todo.column_names
end
