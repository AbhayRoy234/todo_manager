class User < ActiveRecord::Base
  # validates :due_date, presence: true
  validates :first_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  has_secure_password
  has_many :todos

  # BCrypt::Password.create("my password")

  def to_pleasent_string
    # is_completed = completed ? "[x]" : "[]"
    "#{id}   #{name}    #{email} #{password} "
  end
end
