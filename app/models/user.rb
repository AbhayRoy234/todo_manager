class User < ActiveRecord::Base
  def to_pleasent_string
    # is_completed = completed ? "[x]" : "[]"
    "#{id}   #{name}    #{email} #{password} "
  end
end
