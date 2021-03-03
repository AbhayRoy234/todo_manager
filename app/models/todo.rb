require "date"

class Todo < ActiveRecord::Base
  def to_pleasent_string
    is_completed = completed ? "[x]" : "[]"
    "#{due_date.to_s(:long)}  #{id}  #{todo_text} #{is_completed} "
  end

  def self.due_today
    all.where("due_date =?", Date.today)
  end

  def self.due_Overdue
    all.where("due_date < ?", Date.today)
  end

  def self.due_Later
    all.where("due_date > ?", Date.today)
  end

  def self.completed
    all.where("completed = ?", true)
  end

  def self.is_completed
    if completed == true
      true
    end
  end
end
