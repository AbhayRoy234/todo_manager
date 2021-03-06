require "date"

class Todo < ActiveRecord::Base
  belongs_to :user
  validates :todo_text, presence: true
  validates :due_date, presence: true
  validates :todo_text, length: { minimum: 2 }

  def to_pleasent_string
    is_completed = completed ? "[x]" : "[]"
    "#{due_date.to_s(:long)}  #{id}  #{todo_text} #{is_completed} "
  end

  def self.of_user(user)
    all.where(user_id: user.id)
  end

  def self.due_today
    all.where("due_date =?", Date.today)
  end

  def self.due_Overdue
    all.where("due_date < ? and completed = ?", Date.today, false)
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
