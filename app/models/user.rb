class User < ActiveRecord::Base
  has_secure_password
  has_many :todos
  # BCrypt::Password.create("my password")

  def to_pleasent_string
    # is_completed = completed ? "[x]" : "[]"
    "#{id}   #{name}    #{email} #{password} "
  end
end
