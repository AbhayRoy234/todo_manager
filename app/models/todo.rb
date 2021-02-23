class Todo < ActiveRecord::Base
  def to_pleasent_string
    is_completed = completed ? "[x]" : "[]"
    "#{due_date.to_s(:long)}  #{id}  #{todo_text} #{is_completed} "
  end
end
