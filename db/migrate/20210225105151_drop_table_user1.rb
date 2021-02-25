class DropTableUser1 < ActiveRecord::Migration[6.1]
  def change
    drop_table :table_users
  end
end
